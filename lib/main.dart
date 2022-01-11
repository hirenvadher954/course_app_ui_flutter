import 'package:facts_flutter_app/constants.dart';
import 'package:facts_flutter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'models/course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


