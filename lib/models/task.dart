import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 6)
class Task extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  DateTime deadline;

  Task(
      {required this.id,
      required this.title,
      this.description,
      required this.deadline});

  factory Task.create(
          {required String title, String? description, DateTime? dealdine}) =>
      Task(
          id: Uuid().v1(),
          title: title,
          description: description,
          deadline: dealdine ?? DateTime.now());
}
