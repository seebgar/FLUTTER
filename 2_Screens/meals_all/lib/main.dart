import "dart:io";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_all/tabs.dart';
import 'package:meals_all/widgets/categories.dart';
import 'package:meals_all/widgets/category-detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: TabsScreen(),
      // ************ NAVIGATION [1]
      routes: {
        CategoryDetail.ROUTE: (ctx) => CategoryDetail(),
      },
      // ** routes that generate dynamically
      // onGenerateRoute: (settings) {},
      // ** unknown routes
      // onUnknownRoute: (settings) {},
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: Text(
                title,
              ),
            )
          : AppBar(
              title: Text(title),
            ),
      body: CategoriesScreen(),
    );
  }
}
