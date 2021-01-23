import 'package:flutter/material.dart';
import 'package:meals_all/models/categories-data.dart';
import 'package:meals_all/widgets/category.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // * layout
    return GridView(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...DUMMY_CATS.map((cate) {
          return CategoryItem(
            color: cate.color,
            title: cate.title,
            id: cate.id,
          );
        })
      ],
    );
  }
}
