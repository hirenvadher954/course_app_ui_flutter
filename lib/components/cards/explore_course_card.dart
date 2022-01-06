import 'package:facts_flutter_app/models/course.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ExploreCourseCard extends StatelessWidget {
  const ExploreCourseCard({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41),
        child: Container(
          height: 120.0,
          width: 280,
          decoration: BoxDecoration(gradient: course.background),
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(children: [
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
                      height: 6,
                    ),
                    Text(
                      course.courseTitle,
                      style: kCardTitleStyle,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/illustrations/${course.illustration}",
                    fit: BoxFit.cover,
                    height: 100,
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
