import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yourbuddy/models/event.dart';
import 'package:yourbuddy/models/task.dart';
import 'package:yourbuddy/models/transaction.dart';
import 'package:yourbuddy/models/user.dart';
import 'package:yourbuddy/pages/homepage.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox("Event_Database");
  await Hive.openBox("Task_Database");
  await Hive.openBox("Transaction_Database");
  await Hive.openBox("User_Database");

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
