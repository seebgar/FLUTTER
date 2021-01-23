import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final questionMap;
  final int color;
  final colorsVal;
  final onAnswer;

  Quiz(
      {@required this.questionMap,
      @required this.color,
      @required this.colorsVal,
      @required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(txt: questionMap[color]["txt"]),
        Divider(),
        ...(questionMap[color]["answers"] as List<String>).map((ans) {
          return Answer(
            color: colorsVal[color],
            selectHandler: onAnswer,
            txt: ans,
          );
        }).toList(),
      ],
    );
  }
}
