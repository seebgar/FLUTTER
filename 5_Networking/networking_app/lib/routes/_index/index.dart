import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  const Index({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Index"),
        ),
        body: Center(
          child: Row(
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/categorias");
                },
                child: Text("Categorias"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/sistemas");
                },
                child: Text("Sistemas"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
