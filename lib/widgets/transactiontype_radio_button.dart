import 'package:flutter/material.dart';
import 'package:yourbuddy/models/transaction.dart';

class TransactionTypeRadioButton extends StatelessWidget {
  TransactionTypeRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.transactionType,
    required this.onChanged,
  }) : super(key: key);

  String title;
  TransactionType value;
  TransactionType? transactionType;

  Function(TransactionType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RadioListTile<TransactionType>(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: Color(0xff643FDB)),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.all(0.0),
      value: value,
      groupValue: transactionType,
      dense: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff643FDB),
        ),
      ),
      onChanged: onChanged,
    ));
  }
}
