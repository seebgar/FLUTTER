import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_all/widgets/category-detail.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  // * page navigation
  void _onTapCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   CupertinoPageRoute(
    //     builder: (_) {
    //       return CategoryDetail(
    //         categoryId: id,
    //         categoryTitle: title,
    //       );
    //     },
    //   ),
    // );
    // ******* [2] NAVIGATION
    Navigator.of(ctx).pushNamed(
      CategoryDetail.ROUTE,
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // * PAGE NAVIGATION
      onTap: () => _onTapCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(
        16,
      ),
      child: Container(
        // * const for better optimization
        padding: const EdgeInsets.all(
          15.0,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(
                0.9,
              ),
              color.withOpacity(
                0.8,
              ),
            ],
            begin: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
      ),
    );
  }
}
