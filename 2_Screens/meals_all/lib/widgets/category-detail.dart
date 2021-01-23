import "dart:io";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
// ***** NAVIATION [4]
  static const String ROUTE = "/category/detail";

  @override
  Widget build(BuildContext context) {
    // ***** [3] NAVIGATIONS ARGUMENTS
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgs["id"];
    final categoryTitle = routeArgs["title"];

    return Scaffold(
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: Text(
                categoryTitle,
              ),
            )
          : AppBar(
              title: Text(
                categoryTitle,
              ),
            ),
      body: Center(
        child: Text(
          "yei",
        ),
      ),
    );
  }
}
