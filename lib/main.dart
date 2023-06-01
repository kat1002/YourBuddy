import 'package:flutter/material.dart';
import 'package:life_planner/screens/calendar_screen.dart';
import 'package:life_planner/screens/home_screen.dart';
import 'package:life_planner/screens/notifications_screen.dart';
import 'package:life_planner/screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomTabBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _index = 0;
  final screens = [
    HomeScreen(),
    CalendarScreen(),
    NotificationsScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          backgroundColor: Color(0xfff2f2f2),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Color(0xff2d2d2d),
          selectedItemColor: Color(0xff0085ff),
          items: _buildBtmBarItems(),
        ));
  }

  List<BottomNavigationBarItem> _buildBtmBarItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_outlined),
        label: 'Calendar',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications_none),
        label: 'Notification',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Profile',
      )
    ];
  }
}
