import 'package:hive/hive.dart';

part 'calendar_event.g.dart';

@HiveType(typeId: 0)
class Calendar_Event extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  DateTime? dateOfEvent;

  Calendar_Event({required this.title, this.description, this.dateOfEvent});
}
