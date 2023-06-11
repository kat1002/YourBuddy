import 'package:flutter/material.dart';
import 'package:yourbuddy/models/calendar_event.dart';
import 'package:yourbuddy/pages/homepage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        fontFamily: 'SFPro',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
