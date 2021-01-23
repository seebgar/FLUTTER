import 'package:first_app/quiz.dart';
import 'package:first_app/resullt.dart';
import 'package:flutter/material.dart';

void main() {
  var pe = new Person(name: "Seeb");
  var an = new Animal(name: "Brn");
  print(pe.name);
  print(an.name);

  runApp(MyApp());
}

/// Main Class
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

/// State kust be persistent
class MyAppState extends State<MyApp> {
  List<String> colors = ["Red", "Green", "Blue"];
  List<Color> colorsVal = [Colors.red, Colors.green, Colors.blue];
  int color = 0;

  List<Map<String, Object>> questionMap = [
    {
      "txt": "What is the question?",
      "answers": ["One", "Two", "Three"],
    },
    {
      "txt": "What is the other question?",
      "answers": ["Four", "Blue", "Red"],
    },
    {
      "txt": "Where is the question?",
      "answers": ["Not", "Blue"],
    }
  ];

  // change state
  void onAnswer() {
    setState(() {
      color++;
    });
  }

  void restart() {
    setState(() {
      color = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text is a Widget"),
        ),
        body: color != colors.length
            ? Quiz(
                color: color,
                colorsVal: colorsVal,
                onAnswer: onAnswer,
                questionMap: questionMap,
              )
            : Result(
                restart: restart,
              ),
        bottomSheet: Text("Test Footer."),
      ),
    );
  }
}

class Person {
  String name;

  Person({String name = "NA"}) {
    this.name = name;
  }

  Person.robot() {
    this.name = "Robot";
  }

  static read() {
    print("Person static");
  }
}

class Animal {
  String name;

  Animal({this.name = "Bruno"});
}
