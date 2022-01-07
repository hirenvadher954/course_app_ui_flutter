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
                    borderRadius: BorderRadius.circular(2.0)
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
