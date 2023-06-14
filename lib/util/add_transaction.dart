import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yourbuddy/models/transaction.dart';
import 'package:yourbuddy/util/transaction_data_store.dart';
import 'package:yourbuddy/widgets/transactiontype_radio_button.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  late DateTime _selectedDate;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  TransactionType transactionType = TransactionType.Income;
  Category category = Category.Clothing;

  TransactionDataStore db = TransactionDataStore();
  Box user_db = Hive.box("User_Database");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tạo giao dịch',
          style: TextStyle(color: Color(0xff1f1f1f)),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0xff1f1f1f),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: _titleController,
            maxLines: 1,
            decoration: const InputDecoration(labelText: 'title'),
          ),
          TextField(
            controller: _amountController,
            maxLines: 1,
            decoration: const InputDecoration(labelText: 'amount'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _noteController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'note'),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Loại giao dịch',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              TransactionTypeRadioButton(
                  title: 'Thu nhập',
                  value: TransactionType.Income,
                  transactionType: transactionType,
                  onChanged: (value) {
                    setState(() {
                      transactionType = value as TransactionType;
                    });
                  }),
              SizedBox(
                width: 10.0,
              ),
              TransactionTypeRadioButton(
                  title: 'Chi tiêu',
                  value: TransactionType.Expense,
                  transactionType: transactionType,
                  onChanged: (value) {
                    setState(() {
                      transactionType = value as TransactionType;
                    });
                  }),
            ],
          ),
          DropdownButtonFormField(
              value: category,
              items: Category.values
                  .map((e) => DropdownMenuItem(
                        child: Text(e.name),
                        value: e,
                      ))
                  .toList(),
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Color(0xff643FDB),
              ),
              decoration: InputDecoration(
                label: Text(
                  'Loại giao dịch',
                  style: TextStyle(fontSize: 19),
                ),
                prefixIcon: Icon(
                  Icons.wallet,
                  color: Color(0xff643FDB),
                ),
              ),
              onChanged: (val) {
                setState(() {
                  category = val as Category;
                });
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.arrow_forward_rounded,
        ),
        label: Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff643FDB),
        onPressed: () {
          _addTransaction();
        },
      ),
    );
  }

  void _addTransaction() async {
    final title = _titleController.text;
    final amount = _amountController.text;
    final note = _noteController.text;
    if (title.isEmpty) {
      print('title cannot be empty');
      return;
    }

    if (amount.isEmpty) {
      print('amount cannot be empty');
      return;
    }

    print(transactionType);
    print(category);

    await db.createTransaction(Transaction.create(
        title: title,
        amount: double.parse(amount),
        note: note,
        type: transactionType,
        category: category));

    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}
