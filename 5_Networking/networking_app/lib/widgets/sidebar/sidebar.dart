import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';

class SideBarRow extends StatelessWidget {
  final SideBarItem item;

  const SideBarRow({
    @required this.item,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42.0,
          height: 42.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            gradient: item.background,
          ),
          child: item.icon,
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          child: Text(
            item.title,
            style: kCalloutLabelStyle,
          ),
        ),
      ],
    );
  }
}

class SideBarItem {
  final String title;
  final LinearGradient background;
  final Icon icon;

  const SideBarItem({this.title, this.background, this.icon});
}
