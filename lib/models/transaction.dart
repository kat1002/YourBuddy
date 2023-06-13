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
  String? note;
  @HiveField(4)
  TransactionType type;
  @HiveField(5)
  Category category;
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    this.note,
    required this.type,
    required this.category,
  });

  factory Transaction.create(
          {required String title,
          required double amount,
          String? note,
          required TransactionType type,
          required Category category}) =>
      Transaction(
          id: Uuid().v1(),
          title: title,
          amount: amount,
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
