import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function() onDelete;
  final Function()? onTap;
  const TaskItem({
    Key? key,
    required this.task,
    required this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.task,
        color: Colors.green,
      ),
      title: Text(
        task.title,
        style: TextStyle(
            fontFamily: 'SFPro', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        DateFormat.MMMMEEEEd().format(task.deadline).toString(),
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
