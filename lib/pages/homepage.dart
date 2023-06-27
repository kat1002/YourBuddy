import 'package:flutter/material.dart';
import 'package:yourbuddy/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Trang chủ',
          style: TextStyle(
              color: Color(0xff1f1f1f),
              fontSize: 24,
              fontWeight: FontWeight.bold),
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
      drawer: MyDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  'Chào mừng đến với',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'YourBuddy',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Center(
                    child: Image(
                  image: AssetImage("assets/images/time.png"),
                )),
                Text(
                  'Quản lý thời gian',
                  style: TextStyle(fontFamily: 'SF Pro Text', fontSize: 24),
                ),
                Center(
                    child: Image(
                  image: AssetImage("assets/images/moneywise.png"),
                )),
                Text(
                  'Quản lý chi tiêu',
                  style: TextStyle(fontFamily: 'SF Pro Text', fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
