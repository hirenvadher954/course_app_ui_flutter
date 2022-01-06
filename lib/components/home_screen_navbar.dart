import 'package:facts_flutter_app/components/rounded_sidebar_button.dart';
import 'package:facts_flutter_app/components/searchfield_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreenNavBar extends StatelessWidget {
  HomeScreenNavBar({required this.triggerAnimation});

  final Function triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(triggerAnimation:triggerAnimation,),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}
