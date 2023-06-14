import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yourbuddy/models/transaction.dart';
import 'package:yourbuddy/util/add_transaction.dart';
import 'package:yourbuddy/util/edit_transaction.dart';
import 'package:yourbuddy/util/transaction_data_store.dart';
import 'package:yourbuddy/widgets/transaction_item.dart';

import '../drawer.dart';

class Moneywise extends StatefulWidget {
  const Moneywise({super.key});

  @override
  State<Moneywise> createState() => _MoneywiseState();
}

class _MoneywiseState extends State<Moneywise> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  Box user_db = Hive.box("User_Database");
  TransactionDataStore db = TransactionDataStore();

  late List<Transaction> _transactions;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late DateTime _focusedDay = DateTime.now();

  double account = 0;

  @override
  void initState() {
    super.initState();

    account = 0;

    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 1000));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
    _loadDataFromHive();
  }

  _loadDataFromHive() async {
    final firstDay = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final lastDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);

    _transactions = [];

    List transactions = db.box.values.toList();

    for (var transaction in transactions) {
      _transactions.add(transaction);
      switch (transaction.type) {
        case TransactionType.Income:
          account += transaction.amount;
          break;
        case TransactionType.Expense:
          account -= transaction.amount;
          break;
      }
    }

    setState(() {});
  }

  List<Transaction> _getTransactions() {
    return _transactions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Quản lý chi tiêu',
          style: TextStyle(
              color: Color(0xff1f1f1f),
              fontSize: 24,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            _globalKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              'Tài khoản',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
            child: Text(
              '$account VND',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.right,
            ),
          ),
          ..._getTransactions().map(
            (transaction) => TransactionItem(
                transaction: transaction,
                onTap: () async {
                  final res = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditTransaction(
                        transaction: transaction,
                      ),
                    ),
                  );
                  if (res ?? false) {
                    //_loadFirestoreEvents();
                    _loadDataFromHive();
                  }
                },
                onDelete: () async {
                  final delete = await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Delete Event?"),
                      content: const Text("Are you sure you want to delete?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                  if (delete ?? false) {
                    await db.deleteTransaction(transaction);
                    _loadDataFromHive();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff643FDB),
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => AddTransaction(),
            ),
          );
          if (result ?? false) {
            //_loadFirestoreEvents();
            //await _loadEventsFromHive();
            _loadDataFromHive();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
