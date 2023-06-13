import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yourbuddy/models/transaction.dart';

class TransactionDataStore {
  static const taskBoxName = 'Transaction_Database';
  final Box box = Hive.box(taskBoxName);

  Future<void> createTransaction(Transaction transaction) async {
    await box.put(transaction.id, transaction);
  }

  Future<Transaction?> getTransaction(String id) async {
    return box.get(id);
  }

  Future<void> updateTransaction(Transaction transaction) async {
    await transaction.save();
  }

  Future<void> deleteTransaction(Transaction transaction) async {
    await transaction.delete();
  }

  ValueListenable<Box<Transaction>> listenToTasks() {
    return Hive.box<Transaction>(taskBoxName).listenable();
  }
}
