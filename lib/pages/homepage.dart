import 'package:flutter/material.dart';
import 'package:yourbuddy/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          'Trang chủ',
          textAlign: TextAlign.center,
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Center(
              child: Image(
            image: AssetImage("assets\\images\\time.jpg"),
          )),
          Text(
            'Quản lý thời gian',
            style: TextStyle(fontFamily: 'SFProText', fontSize: 36),
          ),
          Center(
              child: Image(
            image: AssetImage("assets\\images\\moneywise.jpg"),
          )),
          Text(
            'Quản lý chi tiêu',
            style: TextStyle(fontFamily: 'SFProText', fontSize: 36),
          ),
        ],
      ),
    );
  }
}
