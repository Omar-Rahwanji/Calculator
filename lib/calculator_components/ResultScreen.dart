import 'dart:ui';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key,required this.result}) : super(key: key);
  String result;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth*0.9,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xffcc2b5e).withOpacity(0.5),
            Color(0xff753a88).withOpacity(0.5),
          ]
        )
      ),
      child: Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(10),
          child: Text(result.toString(),style: TextStyle(fontSize: 48))),
    );
  }
}
