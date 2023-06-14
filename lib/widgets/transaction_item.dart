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
      leading: Icon(
        Icons.wallet_giftcard_rounded,
        color: Colors.orange,
      ),
      title: Text(
        transaction.title,
        style: TextStyle(
            fontFamily: 'SFPro', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        NumberFormat.simpleCurrency(
                    name: 'VND', decimalDigits: 2, locale: "vi_VN")
                .format(transaction.amount) +
            "\n" +
            DateFormat.MMMMEEEEd().format(transaction.date).toString(),
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
