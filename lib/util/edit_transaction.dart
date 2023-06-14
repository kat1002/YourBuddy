import 'package:flutter/material.dart';
import 'package:yourbuddy/models/transaction.dart';
import 'package:yourbuddy/util/transaction_data_store.dart';
import '../widgets/transactiontype_radio_button.dart';

class EditTransaction extends StatefulWidget {
  final Transaction transaction;
  const EditTransaction({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  TransactionDataStore db = TransactionDataStore();

  late TextEditingController _titleController;
  late TextEditingController _noteController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.transaction.title);
    _noteController = TextEditingController(text: widget.transaction.note);
    _amountController =
        TextEditingController(text: widget.transaction.amount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thay đổi giao dịch',
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
                  transactionType: widget.transaction.type,
                  onChanged: (value) {
                    setState(() {
                      widget.transaction.type = value as TransactionType;
                    });
                  }),
              SizedBox(
                width: 10.0,
              ),
              TransactionTypeRadioButton(
                  title: 'Chi tiêu',
                  value: TransactionType.Expense,
                  transactionType: widget.transaction.type,
                  onChanged: (value) {
                    setState(() {
                      widget.transaction.type = value as TransactionType;
                    });
                  }),
            ],
          ),
          DropdownButtonFormField(
              value: widget.transaction.category,
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
                  widget.transaction.category = val as Category;
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
          _updateTransaction();
        },
      ),
    );
  }

  void _updateTransaction() async {
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

    widget.transaction.title = title;
    widget.transaction.note = note;
    widget.transaction.amount = double.parse(amount);

    await db.updateTransaction(widget.transaction);

    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}
