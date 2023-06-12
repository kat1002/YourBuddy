import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';

class EventItem extends StatelessWidget {
  final Event event;
  final Function() onDelete;
  final Function()? onTap;
  const EventItem({
    Key? key,
    required this.event,
    required this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        event.title,
        style: TextStyle(
            fontFamily: 'SFPro', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        DateFormat.yMMMMEEEEd().format(event.date).toString(),
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
