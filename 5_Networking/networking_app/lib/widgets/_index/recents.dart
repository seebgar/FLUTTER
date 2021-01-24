import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';
import 'package:networking_app/widgets/cards/card.dart';
import 'package:networking_app/widgets/cards/course.dart';

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({Key key}) : super(key: key);

  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  List<Container> indicators = [];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            child: PageView.builder(
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    // * ESTO DEBERIA SER NAMED MANEJADO EN ../.ROUTES
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetail(
                          course: recentCourses[index],
                        ),
                        fullscreenDialog: true, // ** bottom to top
                      ),
                    );
                  },
                  child: Opacity(
                    opacity: currentPage == index ? 1.0 : 0.7,
                    child: RecentCourseCard(
                      course: recentCourses[index],
                    ),
                  ),
                );
              },
              itemCount: recentCourses.length,
              controller: PageController(
                initialPage: 0,
                viewportFraction: 0.66,
              ),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CourseDetail extends StatefulWidget {
  final Course course;

  const CourseDetail({@required this.course, Key key}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.hardEdge,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        gradient: widget.course.background,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    // ***
                                    // ***
                                    // ** HERO
                                    // *** hero sirve para mapear a tra vez de un id tag, los componentes que se reutilizan.
                                    // ***Esto hace que se creen una animacion en donde pareciera que los componentes se mueven desde una pantalla a otra
                                    child: Hero(
                                      tag: widget.course.logo,
                                      child: Image.asset(
                                          "assets/logos/${widget.course.logo}"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: widget.course.courseSubtitle,
                                          child: Text(
                                            widget.course.courseSubtitle,
                                            style: kSecondaryCalloutLabelStyle
                                                .copyWith(
                                                    color: Colors.white70),
                                          ),
                                        ),
                                        Hero(
                                          tag: widget.course.courseTitle,
                                          child: Text(
                                            widget.course.courseTitle,
                                            style: kLargeTitleStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ** close btn
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 36.0,
                                      width: 36.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                        color: kPrimaryLabelColor.withOpacity(
                                          0.8,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 28.0,
                            ),
                            Expanded(
                              child: Hero(
                                tag: widget.course.illustration,
                                child: Image.asset(
                                  "assets/illustrations/${widget.course.illustration}",
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ** de aqui para arriba, es pura infor que se muestra tambien en la carta de la pantalla principal
                  // ** como se utilizo HERO, por medio de un tag id, se mapean componentes
                  // ** esto termina dando la islución de que los componentes se translada a la nueva pantalla
                  // ?
                  // ?
                  // **
                  // ** a continuacion es el body de la pantalla empezando por una fila de iconos
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 12.5,
                        bottom: 13.5,
                        left: 20.5,
                        right: 14.5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: kShadowColor,
                            offset: Offset(0, 4),
                            blurRadius: 16.0,
                          ),
                        ],
                      ),
                      width: 60.0,
                      height: 60.0,
                      child: Image.asset("assets/icons/icon-play.png"),
                    ),
                  )
                ],
              ),
              // ** textos de cantidad de estudiantes
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  left: 28.0,
                  right: 28.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // * ROW DE PERSONAS ESTUDAINTES
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                child: Icon(
                                  Platform.isIOS
                                      ? CupertinoIcons.group_solid
                                      : Icons.people,
                                  color: Colors.white,
                                ),
                                radius: 21.0,
                                backgroundColor: kCourseElementIconColor,
                              ),
                              decoration: BoxDecoration(
                                color: kBackgroundColor,
                                borderRadius: BorderRadius.circular(29.0),
                              ),
                            ),
                          ),
                          height: 58.0,
                          width: 58.0,
                          decoration: BoxDecoration(
                            gradient: widget.course.background,
                            borderRadius: BorderRadius.circular(29.0),
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "28.7k",
                              style: kTitle2Style,
                            ),
                            Text(
                              "students",
                              style: kSearchPlaceholderStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                    // ** row de  commnets
                    Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                child: Icon(
                                  Platform.isIOS
                                      ? CupertinoIcons.news_solid
                                      : Icons.format_quote,
                                  color: Colors.white,
                                ),
                                radius: 21.0,
                                backgroundColor: kCourseElementIconColor,
                              ),
                              decoration: BoxDecoration(
                                color: kBackgroundColor,
                                borderRadius: BorderRadius.circular(29.0),
                              ),
                            ),
                          ),
                          height: 58.0,
                          width: 58.0,
                          decoration: BoxDecoration(
                            gradient: widget.course.background,
                            borderRadius: BorderRadius.circular(29.0),
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "12.4k",
                              style: kTitle2Style,
                            ),
                            Text(
                              "comments",
                              style: kSearchPlaceholderStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // * texto largo
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "5 years ago, I couldn’t write a single line of Swift. I learned it and moved to React, Flutter while using increasingly complex design tools. I don’t regret learning them because SwiftUI takes all of their best concepts. It is hands-down the best way for designers to take a first step into code.",
                      style: kBodyLabelStyle,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "About this course",
                      style: kTitle1Style,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "This course was written for people who are passionate about design and about Apple's SwiftUI. It beginner-friendly, but it is also packed with tricks and cool workflows about building the best UI. Currently, Xcode 11 is still in beta so the installation process may be a little hard. However, once you get everything working, then it'll get much friendlier!",
                      style: kBodyLabelStyle,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
