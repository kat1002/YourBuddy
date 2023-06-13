import 'package:flutter/material.dart';
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
      body: Stack(children: [
        Positioned(
          bottom: 10,
          right: 10,
          child: ElevatedButton.icon(
            icon: Icon(
              Icons.arrow_forward_rounded,
            ),
            label: Text(
              'Done',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xff643FDB),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff643FDB)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              _addTransaction();
            },
          ),
        ),
        ListView(
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
                dropdownColor: Color(0xff643FDB),
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
      ]),
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
