import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String txt;

  Question({this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 32, bottom: 32),
      child: Text(
        txt,
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }
}
