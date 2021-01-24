import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';
import 'package:networking_app/routes/_index/profile_screen.dart';
import 'package:networking_app/widgets/_index/search_field.dart';
import 'package:networking_app/widgets/_index/side_bar_btn.dart';

class HomeNavBar extends StatelessWidget {
  final Function triggerAnimation;

  const HomeNavBar({@required this.triggerAnimation, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SideBarButton(
              triggerAnimation: triggerAnimation,
            ),
            // ** search
            SearchFieldWidget(),
            Icon(
              Icons.notifications,
              color: kPrimaryLabelColor,
            ),
            SizedBox(
              width: 16.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ProfileScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage(
                  "assets/images/profile.jpg",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
