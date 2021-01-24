import "dart:io";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';
import 'package:networking_app/widgets/sidebar/sidebar.dart';

class SideBarMenu extends StatelessWidget {
  SideBarMenu({Key key}) : super(key: key);

  final List<SideBarItem> sidebarItems = [
    SideBarItem(
      title: "Home",
      background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF00AEFF),
          Color(0xFF0076FF),
        ],
      ),
      icon: Icon(
        Icons.home,
        color: Colors.white,
      ),
    ),
    SideBarItem(
      title: "Courses",
      background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFA7d75),
          Color(0xFFC23D61),
        ],
      ),
      icon: Icon(
        Platform.isIOS ? CupertinoIcons.book_solid : Icons.library_books,
        color: Colors.white,
      ),
    ),
    SideBarItem(
      title: "Billing",
      background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFAD64A),
          Color(0xFFEA880F),
        ],
      ),
      icon: Icon(
        Icons.credit_card,
        color: Colors.white,
      ),
    ),
    SideBarItem(
      title: "Settings",
      background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF4E62CC),
          Color(0xFF202A78),
        ],
      ),
      icon: Icon(
        Platform.isIOS ? CupertinoIcons.settings_solid : Icons.settings,
        color: Colors.white,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SideBarScreen(
      sidebarItems: sidebarItems,
    );
  }
}

class SideBarScreen extends StatelessWidget {
  const SideBarScreen({
    Key key,
    @required this.sidebarItems,
  }) : super(key: key);

  final List<SideBarItem> sidebarItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSidebarBackgroundColor,
        //borderRadius: BorderRadius.only(
        //topRight: Radius.circular(34.0),
        //),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.symmetric(
        vertical: 35.0,
        horizontal: 20.0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/profile.jpg",
                  ),
                  radius: 21.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sebastian Garcia",
                      style: kHeadlineLabelStyle,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Licence",
                      style: kSearchPlaceholderStyle,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            SideBarRow(
              item: sidebarItems[0],
            ),
            SizedBox(
              height: 32.0,
            ),
            SideBarRow(
              item: sidebarItems[1],
            ),
            SizedBox(
              height: 32.0,
            ),
            SideBarRow(
              item: sidebarItems[2],
            ),
            SizedBox(
              height: 32.0,
            ),
            SideBarRow(
              item: sidebarItems[3],
            ),
            SizedBox(
              height: 32.0,
            ),
            Spacer(),
            Row(
              children: [
                Image.asset(
                  "assets/icons/icon-logout.png",
                  width: 17.0,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  "Logout",
                  style: kSecondaryCalloutLabelStyle,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
