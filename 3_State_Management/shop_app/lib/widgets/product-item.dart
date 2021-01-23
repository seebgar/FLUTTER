import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/product_detail.dart';

class ProductItem extends StatelessWidget {
  // final Product product;

  // ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context,
        listen: false); // ** only the favorite icon is going to change

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        12,
      ),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetail.ROUTE,
              arguments: {
                "id": product.id,
              },
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          title: Text(
            product.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          backgroundColor: Colors.grey.withOpacity(0.9),
          // leading: IconButton(
          //   icon: Icon(Icons.favorite),
          //   onPressed: () {},
          // ),
          // *** only this icon is changed and updated === PERFORMANCE
          // *** updates only one part of the widget. Ither alternative is
          // *** to extract to external widget an use provider listener true / false
          trailing: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(product.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border_rounded),
              onPressed: () {
                product.toggleFavorite();
                // *** DIALOG
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text(
                          "Sure",
                        ),
                        actions: [
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text(
                              "OK",
                            ),
                          ),
                        ],
                      );
                    });

                // *** POPUP info
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Fovrited!",
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                        label: "UNDO",
                        onPressed: () {
                          product.toggleFavorite();
                        }),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
