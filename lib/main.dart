import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yourbuddy/pages/homepage.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('Calendar_EventDB');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        fontFamily: 'SFProText',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
