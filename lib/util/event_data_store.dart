import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yourbuddy/models/event.dart';

class EventDataStore {
  static const taskBoxName = 'Event_Database';
  final Box box = Hive.box(taskBoxName);

  Future<void> createEvent(Event event) async {
    await box.put(event.id, event);
  }

  Future<Event?> getEvent(String id) async {
    return box.get(id);
  }

  Future<void> updateEvent(Event event) async {
    await event.save();
  }

  Future<void> deleteEvent(Event event) async {
    await event.delete();
  }

  ValueListenable<Box<Event>> listenToTasks() {
    return Hive.box<Event>(taskBoxName).listenable();
  }
}
