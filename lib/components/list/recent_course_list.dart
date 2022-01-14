import 'package:facts_flutter_app/models/course.dart';
import 'package:facts_flutter_app/screens/course_screen.dart';
import 'package:flutter/material.dart';

import '../cards/recent_course_card.dart';

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({Key? key}) : super(key: key);

  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  List<Container> indicator = [];
  int curruntPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map((course) {
        var index = recentCourses.indexOf(course);
        return Container(
          height: 7,
          width: 7,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  curruntPage == index ? Color(0XFF0971FE) : Color(0XFFA6AEBD)),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
            itemCount: recentCourses.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseScreen(course: recentCourses[index],),
                      fullscreenDialog: true
                    )),
                child: Opacity(
                  opacity: curruntPage == index ? 1.0 : 0.5,
                  child: RecentCourseCard(
                    course: recentCourses[index],
                  ),
                ),
              );
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.7),
            onPageChanged: (index) {
              setState(() {
                curruntPage = index;
              });
            },
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}
