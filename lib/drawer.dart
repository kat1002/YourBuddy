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
        color: Colors.deepPurple[200],
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  'Have a nice day!',
                  style: TextStyle(
                    fontFamily: "SFProText",
                    fontSize: 56,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                'Thông báo',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.access_alarm_rounded),
              title: Text(
                'Quản lý thời gian',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TimeManagement()));
              },
            ),
            ListTile(
              leading: Icon(Icons.wallet),
              title: Text(
                'Quản lý chi tiêu',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Moneywise()));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_outlined),
              title: Text(
                'Lịch',
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
