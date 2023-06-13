import 'package:flutter/material.dart';
import 'package:yourbuddy/models/transaction.dart';
import 'package:yourbuddy/util/add_transaction.dart';
import 'package:yourbuddy/util/transaction_data_store.dart';

import '../drawer.dart';

class Moneywise extends StatefulWidget {
  const Moneywise({super.key});

  @override
  State<Moneywise> createState() => _MoneywiseState();
}

class _MoneywiseState extends State<Moneywise> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  TransactionDataStore db = TransactionDataStore();

  late Map<DateTime, List<Transaction>> _transactions;
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

    _transactions = {};

    List transactions = db.box.values.toList();

    for (var transaction in transactions) {
      final month = DateTime.utc(transaction.date.year, transaction.date.month);
      if (_transactions[month] == null) {
        _transactions[month] = [];
      }
      _transactions[month]!.add(transaction);
      account += transaction.amount.toDouble();
    }

    setState(() {});
  }

  List<Transaction> _getTransactionsForTheMonth(DateTime month) {
    return _transactions[month] ?? [];
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
      body: Column(
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
            await _loadDataFromHive();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
