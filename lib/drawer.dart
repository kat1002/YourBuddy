import 'package:flutter/material.dart';
import 'package:yourbuddy/pages/calendar.dart';
import 'package:yourbuddy/pages/moneywise.dart';
import 'package:yourbuddy/pages/notification.dart';
import 'package:yourbuddy/pages/timemanagement.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple[400],
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
              width: 168,
              height: 67,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        'Have a',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          letterSpacing: 0.5,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 40,
                    child: SizedBox(
                      width: 120,
                      child: Text(
                        'nice day',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontSize: 30,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
            ListTile(
              leading: Icon(
                Icons.notifications_active_outlined,
                color: Color(0xff1c1243),
              ),
              title: Text(
                'Thông báo',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotiPage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.access_alarm_rounded,
                color: Color(0xff1c1243),
              ),
              title: Text(
                'Quản lý thời gian',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TimeManagement()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.wallet,
                color: Color(0xff1c1243),
              ),
              title: Text(
                'Quản lý chi tiêu',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Moneywise()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month_outlined,
                color: Color(0xff1c1243),
              ),
              title: Text(
                'Lịch',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Calendar()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
