import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yourbuddy/models/event.dart';
import 'package:yourbuddy/pages/homepage.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(EventAdapter());

  await Hive.openBox("Event_Database");
  await Hive.openBox("Task_Database");
  await Hive.openBox("Transaction_Database");

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
