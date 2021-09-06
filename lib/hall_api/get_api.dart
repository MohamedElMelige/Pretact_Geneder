import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pretactgeneder/hall_Card.dart';

class HallGetApi extends StatefulWidget {
  @override
  _HallGetApiState createState() => _HallGetApiState();
}

class _HallGetApiState extends State<HallGetApi> {
  List<HallCard> myCard = [];
  getHallData() async {
    String url = 'https://young-reaches-10557.herokuapp.com/search';
    var res = await http.get(url);
    var body = jsonDecode(res.body);
    var newName;
    //--------------------------------------------------
    for(int i =0 ;i<5;i++){
      String doctor = body[i]['doctor'];
      String subject = body[i]['subject'];
      String hall = body[i]['hall'];
      String from = body[i]['from'];
      String to = body[i]['to'];
      String id =body[i]['_id'];
      //---------------------------------------------------------------
      var itemCard = HallCard(
        doctor: doctor,
        subject: subject,
        from: from,
        to: to,
        onChanged: (id){
          newName=id;
        },
        onPressed: ()async{
          await http.patch('https://young-reaches-10557.herokuapp.com/update/$id',
          headers: <String, String>{
            'Content-Type':'application/json; charset=UTF-8'
          },
          body:jsonEncode(<String, String>{
            'doctor':newName
              }));
        },
        DeleteFunction: ()async{
          await http.patch('https://young-reaches-10557.herokuapp.com/delete/$id',
            headers: <String, String>{
            'Content-Type':'application/json; charset=UTF-8'
          },);
        },
      );
      myCard.add(itemCard);
    }
    setState(() {});
  }
  @override
   void initState(){
    getHallData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hall Get Data'),
      ),
      body: ListView(
        children: (myCard.length==0)?[Center(
          child: CircularProgressIndicator(),
        )]:myCard,
      ),
    );
  }
}
