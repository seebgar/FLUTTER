import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function restart;

  Result({this.restart});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          "DONE!",
          style: TextStyle(fontSize: 32),
        ),
        RaisedButton(
          child: Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          color: Colors.amberAccent,
          onPressed: restart,
        )
      ],
    ));
  }
}
