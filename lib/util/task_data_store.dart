import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/task.dart';

class TaskDataStore {
  static const taskBoxName = 'Task_Database';
  final Box box = Hive.box(taskBoxName);

  Future<void> createTask(Task task) async {
    await box.put(task.id, task);
  }

  Future<Task?> getTask(String id) async {
    return box.get(id);
  }

  Future<void> updateTask(Task task) async {
    await task.save();
  }

  Future<void> deleteTask(Task task) async {
    await task.delete();
  }

  ValueListenable<Box<Task>> listenToTasks() {
    return Hive.box<Task>(taskBoxName).listenable();
  }
}
