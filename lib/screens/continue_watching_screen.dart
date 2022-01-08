import 'package:facts_flutter_app/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(34)),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(
            color: kShadowColor, offset: Offset(0, -12), blurRadius: 32.0),
      ],
      minHeight: 85,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        children: [
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: 12, bottom: 16),
                child: Container(
                  width: 42,
                  height: 4.0,
                  decoration: BoxDecoration(
                      color: Color(0XFFC5CBD6),
                      borderRadius: BorderRadius.circular(2.0)),
                )),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Contine Watching",
                style: kTitle2Style,
              )),
          ContinueWatchingList(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Certificates",
                style: kTitle2Style,
              )),
        ],
      ),
    );
  }
}

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

class ContinueWatchingCard extends StatelessWidget {
  const ContinueWatchingCard({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Container(
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
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41.0),
                child: Container(
                  height: 140,
                  width: 260,
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
                                'assets/illustrations/${course.illustration}',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Image.asset('assets/icons/icon-play.png'),
            width: 60,
            height: 60,
            padding: EdgeInsets.only(
                top: 12.5, bottom: 13.5, left: 20.5, right: 14.5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor,
                    offset: Offset(0, 4),
                    blurRadius: 16.0,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
