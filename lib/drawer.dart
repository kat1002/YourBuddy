import 'package:flutter/material.dart';
import 'package:yourbuddy/pages/notification.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple[100],
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.wallet),
              title: Text(
                'Quản lý chi tiêu',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_outlined),
              title: Text(
                'Lịch biểu',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Cài đặt',
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
