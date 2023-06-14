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
  DateTime date;
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
    required this.date,
    this.note,
    required this.type,
    required this.category,
  });

  factory Transaction.create(
          {required String title,
          required double amount,
          String? note,
          DateTime? date,
          required TransactionType type,
          required Category category}) =>
      Transaction(
          id: Uuid().v1(),
          title: title,
          amount: amount,
          date: DateTime.now(),
          type: type,
          category: category);
}

@HiveType(typeId: 4)
enum TransactionType {
  @HiveField(0)
  Income,
  @HiveField(1)
  Expense
}

@HiveType(typeId: 5)
enum Category {
  @HiveField(0)
  Housing,
  @HiveField(1)
  Transportation,
  @HiveField(2)
  Food,
  @HiveField(3)
  Ultilities,
  @HiveField(4)
  Clothing,
  @HiveField(5)
  Healthcare,
  @HiveField(6)
  Insurance,
  @HiveField(7)
  Supplies,
  @HiveField(8)
  Personal,
  @HiveField(9)
  Debt,
  @HiveField(10)
  Education,
  @HiveField(11)
  Gifts,
  @HiveField(12)
  Entertainment
}
