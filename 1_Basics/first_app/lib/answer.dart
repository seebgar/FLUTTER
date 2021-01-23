import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Color color;
  final Function selectHandler; // parent child communication
  final String txt;

  Answer({this.color, this.selectHandler, this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 64, right: 64, top: 24),
      child: RaisedButton(
        child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: color,
        onPressed: selectHandler,
      ),
    );
  }
}
