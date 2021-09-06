import 'package:flutter/material.dart';
import 'hall_api/get_api.dart';
import 'predict_gender.dart';
import 'secand_page.dart';

void main(){
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HallGetApi(),
    );
  }
}
