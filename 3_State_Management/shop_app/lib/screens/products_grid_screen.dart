import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/product-item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    final products = productProvider.items;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ** amount of columns
        childAspectRatio: 2 / 2, // ** taller than wider
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i], // ** value for static data, is not going to change
        child: ProductItem(
            // product: products[i],
            ),
      ),
      padding: const EdgeInsets.all(
        10,
      ),
      itemCount: products.length,
    );
  }
}
