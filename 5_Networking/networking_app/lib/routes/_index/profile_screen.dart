import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kCardPopupBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(34.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor,
                    offset: Offset(0, 12),
                    blurRadius: 32.0,
                  )
                ],
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    // ** top bar
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 32.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ** back button
                          RawMaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            constraints: BoxConstraints(
                              minWidth: 40.0,
                              maxWidth: 40.0,
                              maxHeight: 24.0,
                            ),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: kSecondaryLabelColor,
                                )
                              ],
                            ),
                          )
                          // ** text profile
                          ,
                          Text(
                            "Profile",
                            style: kCalloutLabelStyle,
                          ),
                          // ** button settings
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.0),
                              boxShadow: [
                                BoxShadow(
                                  color: kShadowColor,
                                  offset: Offset(0, 12),
                                  blurRadius: 32.0,
                                )
                              ],
                            ),
                            child: Icon(
                              Platform.isIOS
                                  ? CupertinoIcons.settings_solid
                                  : Icons.settings,
                              color: kSecondaryLabelColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    // * profile image and name
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/profile.jpg",
                                  ),
                                  radius: 30.0,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(42.0),
                                ),
                              ),
                            ),
                            height: 84.0,
                            width: 84.0,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Color(0xFF00AEFF),
                                  Color(0xFF0076FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(42.0),
                            ),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sebastian Garcia",
                                style: kTitle2Style,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Flutter developer",
                                style: kSecondaryCalloutLabelStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    /// * badges
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, bottom: 16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Badges",
                                  style: kHeadlineLabelStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "See all",
                                      style: kSearchPlaceholderStyle,
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: kSecondaryLabelColor,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 112.0,
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kShadowColor.withOpacity(0.1),
                              offset: Offset(0, 12),
                              blurRadius: 18.0,
                            ),
                          ],
                        ),
                        child: Image.asset("assets/badges/badge-01.png"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
