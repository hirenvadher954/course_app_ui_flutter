import 'package:facts_flutter_app/models/course.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class RecentCourseCard extends StatelessWidget {
  const RecentCourseCard({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(41),
                gradient: course.background,
                boxShadow: [
                  BoxShadow(
                      color: course.background.colors[0].withOpacity(0.3),
                      offset: Offset(0, 20),
                      blurRadius: 30),
                  BoxShadow(
                      color: course.background.colors[1].withOpacity(0.3),
                      offset: Offset(0, 20),
                      blurRadius: 30),
                ]),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: course.courseSubtitle,
                        child: Text(
                          course.courseSubtitle,
                          style: kCardSubtitleStyle,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Hero(
                        tag: course.courseSubtitle,
                        child: Text(
                          course.courseTitle,
                          style: kCardTitleStyle,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Hero(
                  tag: 'assets/illustrations/${course.illustration}',
                  child: Image.asset(
                    'assets/illustrations/${course.illustration}',
                    fit: BoxFit.cover,
                  ),
                ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 42.0),
          child: Container(
            child: Hero(
                tag: course.logo!,
                child: Image.asset('assets/logos/${course.logo}')),
            width: 60,
            height: 60,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                      color: kShadowColor,
                      offset: Offset(0, 4),
                      blurRadius: 16.0)
                ]),
          ),
        )
      ],
    );
  }
}
