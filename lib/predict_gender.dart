import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class predict_gender extends StatefulWidget {
  @override
  _predict_genderState createState() => _predict_genderState();
}

class _predict_genderState extends State<predict_gender> {
  String name;
  String gender;
  double probability;
  bool spinner =false;
  Future predictrGender() async{
    String url='https://api.genderize.io/?name=$name';
    var res = await http.get(url);
    var body =jsonDecode(res.body);
    gender=body['gender'];
    probability=body['probability'];

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Predict Your Gender',style: TextStyle(fontSize: 30),),
          centerTitle: true,
        ),
        body: ModalProgressHUD(
          inAsyncCall: spinner,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Enter Your Name',style: TextStyle(fontSize: 20),),
                TextField(
                  onChanged: (value){
                    name=value;
                    print(name);
                  },
                  decoration: InputDecoration(
                    hintText: 'enter name',
                    border: OutlineInputBorder(),
                    labelText: 'name'
                  ),
                ),
                FlatButton(
                  color: Colors.teal,
                    onPressed: ()async{
                    setState(() {
                      spinner=true;
                    });
                    await predictrGender();
                    setState(() {
                      spinner=false;
                    });
                    }, child:Text('predict',style: TextStyle(color: Colors.white),) ),
                (gender==null)?SizedBox():RotateAnimatedTextKit(

                    onTap: () {
                      print("Tap Event");
                    },
                    text: ["Gender", "$gender", "probability", "$probability"],
                    textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon"),
                    textAlign: TextAlign.start
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
