import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'money.g.dart';

@HiveType(typeId: 1)
class Money extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double amount;

  Money({required this.id, required this.title, required this.amount});

  factory Money.create({required String title, double? amount}) =>
      Money(id: Uuid().v1(), title: title, amount: amount ?? 0);
}
