import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currPage = 0;

  Widget bodyFunc() {
    switch (_currPage) {
      case 1:
        return moneywiseScreen();
      case 2:
        return taskManagementScreen();
      default:
        return mainHomeScreen();
    }
  }

  Widget mainHomeScreen() {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 7),
                    child: Column(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          'Status',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    )),
                CircleAvatar(
                  radius: 40,
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 350,
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    print('test 1');
                    setState(() {
                      _currPage = 1;
                    });
                  },
                  child: Text('Moneywise'),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 350,
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    print('test 2');
                    print('${_currPage}');
                    setState(() {
                      _currPage = 2;
                    });
                  },
                  child: Text('Task Management'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget moneywiseScreen() {
    return Scaffold();
  }

  Widget taskManagementScreen() {
    return Scaffold();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyFunc(),
    );
  }
}
