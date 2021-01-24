import 'package:flutter/material.dart';
import 'package:networking_app/constants.dart';
import 'package:networking_app/widgets/cards/course.dart';

class ExploreCourseList extends StatelessWidget {
  const ExploreCourseList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true, // * fit only contents
        itemCount: exploreCourses.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
            child: ExploreCard(
              course: exploreCourses[index],
            ),
          );
        },
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  final Course course;

  const ExploreCard({@required this.course, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120.0,
          width: 280.0,
          decoration: BoxDecoration(gradient: course.background),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
            ),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    )
                  ],
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/illustrations/${course.illustration}",
                      fit: BoxFit.cover,
                      height: 100.0,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
