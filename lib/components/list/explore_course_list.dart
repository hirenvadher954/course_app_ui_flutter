import 'package:facts_flutter_app/components/cards/explore_course_card.dart';
import 'package:facts_flutter_app/models/course.dart';
import 'package:flutter/material.dart';

class ExploreCourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: exploreCourses.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0),
              child: ExploreCourseCard(course: exploreCourses[index]),
            );
          }),
    );
  }
}
