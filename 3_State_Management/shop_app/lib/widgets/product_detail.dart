import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductDetail extends StatelessWidget {
  static const String ROUTE = "/products/detail";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String id = routeArgs["id"];
    final Product product =
        Provider.of<Products>(context, listen: false).findById(id);

    return Container(
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text(
            product.title,
          ),
        ),
        body: Center(
          child: Text(
            "DETAIL",
          ),
        ),
      ),
    );
  }
}
