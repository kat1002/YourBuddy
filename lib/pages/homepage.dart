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
      drawer: MyDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(
              onPressed: () {
                _globalKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu),
              color: Colors.black,
            ),
            Column(
              children: [
                Text(
                  'Chào mừng đến với',
                  style: TextStyle(
                      fontFamily: 'SFPro',
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'YourBuddy',
                  style: TextStyle(
                      fontFamily: 'SFPro',
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Center(
                    child: Image(
                  image: AssetImage("assets/images/time.png"),
                )),
                Text(
                  'Quản lý thời gian',
                  style: TextStyle(fontFamily: 'SFPro', fontSize: 24),
                ),
                Center(
                    child: Image(
                  image: AssetImage("assets/images/moneywise.png"),
                )),
                Text(
                  'Quản lý chi tiêu',
                  style: TextStyle(fontFamily: 'SFPro', fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
