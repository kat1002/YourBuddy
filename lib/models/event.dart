import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'event.g.dart';

@HiveType(typeId: 0)
class Event extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  DateTime date;

  Event({
    required this.id,
    required this.title,
    this.description,
    required this.date,
  });

  factory Event.create(
          {required String title, String? descp, DateTime? date}) =>
      Event(
          id: Uuid().v1(),
          title: title,
          description: descp,
          date: date ?? DateTime.now());
}
