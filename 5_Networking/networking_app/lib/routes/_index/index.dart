import 'dart:math';

import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';
import 'package:networking_app/routes/_index/sidebar.dart';
import 'package:networking_app/widgets/_index/explore_courses.dart';
import 'package:networking_app/widgets/_index/home_nav_bar.dart';
import 'package:networking_app/widgets/_index/recents.dart';
import 'package:networking_app/widgets/cards/course.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Index extends StatelessWidget {
  const Index({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // * menu
  Animation<Offset> sidebarAnimation;
  AnimationController sidebarAnimationCtr;
  // * menu backgorund
  Animation<double> fadeAnimation;
  bool sidebarHidden = true;

  @override
  void initState() {
    super.initState();

    sidebarAnimationCtr = AnimationController(
      vsync: this, // * need the with
      duration: Duration(
        milliseconds: 250,
      ),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: sidebarAnimationCtr, curve: Curves.easeInOut),
    ); // * type of animation defines the cure, position, speed

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: sidebarAnimationCtr, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    sidebarAnimationCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeNavBar(
                      triggerAnimation: () {
                        sidebarAnimationCtr.forward();
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Recents",
                            style: kLargeTitleStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "23 courses, more cmming",
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RecentCourseList(),
                    Padding(
                      padding: const EdgeInsets.only(
                        // left: 20.0,
                        // right: 20.0,
                        top: 25.0,
                        bottom: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Explorer",
                              style: kTitle1Style,
                            ),
                          ),
                          ExploreCourseList()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // * sliding up panel
            ContinueWatchingScreem(),
            // * menu s overlapped because of stack
            IgnorePointer(
              ignoring: sidebarHidden,
              child: Stack(
                children: [
                  // * dark background
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: GestureDetector(
                      onTap: () {
                        // * close nav
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                        sidebarAnimationCtr.reverse();
                      },
                      child: Container(
                        color: Color.fromRGBO(36, 38, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: sidebarAnimation,
                    child: SafeArea(
                      child: SideBarMenu(),
                      bottom: false,
                      top: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContinueWatchingScreem extends StatelessWidget {
  const ContinueWatchingScreem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34.0),
        topRight: Radius.circular(34.0),
      ),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(
          color: kShadowColor,
          offset: Offset(0, -12),
          blurRadius: 32.0,
        )
      ],
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 16.0),
              child: Container(
                width: 42.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFC5CBD6),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: Text(
                "Continue watching",
                style: kTitle2Style,
              ),
            ),
          ),
          SizedBox(
            height: 26.0,
          ),
          ContinueWatchinglist(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: Text(
              "Certificates",
              style: kTitle2Style,
            ),
          ),
          Expanded(
            child: CertificateViewer(),
          ),
        ],
      ),
    );
  }
}

class CertificateViewer extends StatefulWidget {
  CertificateViewer({Key key}) : super(key: key);

  @override
  _CertificateViewerState createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {
  final List<String> certificatePaths = [
    'assets/certificates/certificate-01.png',
    'assets/certificates/certificate-02.png',
    'assets/certificates/certificate-03.png',
  ];

  Widget certificateViewer;

  @override
  void initState() {
    super.initState();
    var imageChildren = <Widget>[];
    certificatePaths.reversed.toList().asMap().forEach((index, certificate) {
      int angleDegree;
      if (index == certificatePaths.length - 1)
        angleDegree = 0;
      else
        angleDegree = Random().nextInt(10) - 5;

      imageChildren.add(
        Transform.rotate(
          angle: angleDegree * (pi / 180),
          child: Image.asset(
            certificate,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );
    });

    certificateViewer = Stack(
      children: imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: certificateViewer,
      ),
    );
  }
}

class ContinueWatchinglist extends StatefulWidget {
  ContinueWatchinglist({Key key}) : super(key: key);

  @override
  _ContinueWatchinglistState createState() => _ContinueWatchinglistState();
}

class _ContinueWatchinglistState extends State<ContinueWatchinglist> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 220.0,
          width: double.infinity,
          child: PageView.builder(
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.75,
            ),
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: continueWatchingCourses.length,
            itemBuilder: (ctx, index) {
              return Opacity(
                opacity: index == currentIndex ? 1.0 : 0.5,
                child: ContinueWatchingcard(
                  course: continueWatchingCourses[index],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class ContinueWatchingcard extends StatelessWidget {
  final Course course;

  const ContinueWatchingcard({this.course, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: course.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                    color: course.background.colors[0].withOpacity(0.3),
                    offset: Offset(0, 20.0),
                    blurRadius: 20.0,
                  ),
                  BoxShadow(
                    color: course.background.colors[1].withOpacity(0.3),
                    offset: Offset(0, 20.0),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41.0),
                child: Container(
                  height: 140.0,
                  width: 260.0,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/illustrations/${course.illustration}",
                                fit: BoxFit.cover,
                                height: 110,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              course.courseSubtitle,
                              style: kCardSubtitleStyle,
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              course.courseTitle,
                              style: kCardTitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Image.asset(
              "assets/icons/icon-play.png",
            ),
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 4),
                  blurRadius: 16.0,
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 12.5,
              bottom: 13.5,
              left: 20.5,
              right: 14.5,
            ),
          ),
        ],
      ),
    );
  }
}

//  Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed("/categorias");
//                 },
//                 child: Text("Categorias"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed("/sistemas");
//                 },
//                 child: Text("Sistemas"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed("/login");
//                 },
//                 child: Text("Login"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed("/menu");
//                 },
//                 child: Text("Menu"),
//               ),
//             ],
//           ),
