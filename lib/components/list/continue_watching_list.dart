import 'package:facts_flutter_app/components/cards/continue_watching_card.dart';
import 'package:facts_flutter_app/models/course.dart';
import 'package:flutter/material.dart';

class ContinueWatchingList extends StatefulWidget {
  const ContinueWatchingList({Key? key}) : super(key: key);

  @override
  _ContinueWatchingListState createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
  List<Container> indicators = [];

  int curruntPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: continueWatchingCourses.map((course) {
        var index = continueWatchingCourses.indexOf(course);
        return Container(
          width: 7,
          height: 7,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: curruntPage == index ? Color(0XFF0971FE) : Color(0XFFA6AEBD),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
              itemCount: continueWatchingCourses.length,
              onPageChanged: (index) {
                setState(() {
                  curruntPage = index;
                });
              },
              controller:
              PageController(initialPage: 0, viewportFraction: 0.75),
              itemBuilder: (context, index) {
                return ContinueWatchingCard(
                    course: continueWatchingCourses[index]);
              }),
        ),
        updateIndicators()
      ],
    );
  }
}
