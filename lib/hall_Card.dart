import 'package:flutter/material.dart';

class HallCard extends StatelessWidget {
  HallCard({this.doctor,this.from,this.hallNumber,this.subject,this.to,this.onChanged,this.onPressed,this.DeleteFunction}){

}
final String doctor,subject,hallNumber , from , to;
  final Function onChanged;
  final Function onPressed,DeleteFunction;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Column(
        children: [
          Text('$doctor:'),
          Text('$subject:'),
          Text('$hallNumber:'),
          Text('$from:'),
          Text('$to:'),
          TextField(
            onChanged: onChanged ,
          ),
          FlatButton(onPressed: onPressed, child: Text('Update')),
          FlatButton(onPressed: DeleteFunction, child: Text('Delete'))
        ],
      ),
    );
  }
}
