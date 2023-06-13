import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function() onDelete;
  final Function()? onTap;
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        transaction.title,
        style: TextStyle(
            fontFamily: 'SFPro', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        transaction.amount.toString(),
      ),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        color: Color(0xff1f1f1f),
        onPressed: onDelete,
      ),
    );
  }
}
