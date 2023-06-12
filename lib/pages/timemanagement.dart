import 'package:flutter/material.dart';

import '../drawer.dart';

class TimeManagement extends StatefulWidget {
  const TimeManagement({super.key});

  @override
  State<TimeManagement> createState() => _TimeManagementState();
}

class _TimeManagementState extends State<TimeManagement> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _globalKey,
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Quản lý thời gian',
          style: TextStyle(color: Color(0xff1f1f1f)),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            _globalKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
    );
  }
}
