import 'package:flutter/material.dart';

import '../drawer.dart';

class Moneywise extends StatefulWidget {
  const Moneywise({super.key});

  @override
  State<Moneywise> createState() => _MoneywiseState();
}

class _MoneywiseState extends State<Moneywise> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

    int account = 0;

    return Scaffold(
        key: _globalKey,
        drawer: MyDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Quản lý chi tiêu',
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                'Tài khoản',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Text(
                '$account VND',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ));
  }
}
