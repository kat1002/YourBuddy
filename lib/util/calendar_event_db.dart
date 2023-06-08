import 'package:hive_flutter/hive_flutter.dart';

final _myBox = Hive.box('Calendar_EventDB');

class EventDatabase {
  List eventList = [];

  void createDefaultData() {
    eventList = [];
  }
}
