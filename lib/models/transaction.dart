import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'transaction.g.dart';

@HiveType(typeId: 1)
class Transaction extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double amount;
  @HiveField(3)
  DateTime? date;
  @HiveField(4)
  String? note;
  @HiveField(5)
  TransactionType type;
  @HiveField(6)
  Category category;
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    this.date,
    this.note,
    required this.type,
    required this.category,
  });

  factory Transaction.create(
          {required String title,
          required double amount,
          DateTime? date,
          String? note,
          required TransactionType type,
          required Category category}) =>
      Transaction(
          id: Uuid().v1(),
          title: title,
          amount: amount,
          date: date ?? DateTime.now(),
          type: type,
          category: category);
}

enum TransactionType { Income, Expense }

enum Category {
  Housing,
  Transportation,
  Food,
  Ultilities,
  Clothing,
  Healthcare,
  Insurance,
  Supplies,
  Personal,
  Debt,
  Education,
  Gifts,
  Entertainment
}
