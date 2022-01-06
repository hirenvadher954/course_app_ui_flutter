import 'package:facts_flutter_app/components/home_screen_navbar.dart';
import 'package:facts_flutter_app/components/list/explore_course_list.dart';
import 'package:facts_flutter_app/components/list/recent_course_list.dart';
import 'package:facts_flutter_app/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sidebarAnimationController;

  bool sidebarHidden = true;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: sidebarAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(children: [
          SafeArea(
            child: Column(
              children: [
                HomeScreenNavBar(triggerAnimation: () {
                  setState(() {
                    sidebarHidden = !sidebarHidden;
                  });
                  sidebarAnimationController.forward();
                }),
                SizedBox(
                  height: 20,
                ),
                RecentCourseList(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Explore",
                        style: kTitle1Style,
                      ),
                    ],
                  ),
                ),
                ExploreCourseList(),
              ],
            ),
          ),
          IgnorePointer(
            ignoring: sidebarHidden,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: fadeAnimation,
                  child: GestureDetector(
                    child: Container(
                      color: Color.fromRGBO(36, 38, 41, 0.4),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    onTap: () => {
                      sidebarAnimationController.reverse(),
                      setState(() {
                        sidebarHidden = !sidebarHidden;
                      })
                    },
                  ),
                ),
                SlideTransition(
                  position: sidebarAnimation,
                  child: SafeArea(
                    bottom: false,
                    child: SidebarScreen(),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
