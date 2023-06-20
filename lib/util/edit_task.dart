import 'package:flutter/material.dart';
import 'package:yourbuddy/util/task_data_store.dart';
import '../models/task.dart';

class EditTask extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final Task task;
  const EditTask(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      required this.task})
      : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TaskDataStore db = TaskDataStore();

  late DateTime _selectedDate;
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.task.deadline;
    _titleController = TextEditingController(text: widget.task.title);
    _descController = TextEditingController(text: widget.task.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sửa Task',
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
          InputDatePickerFormField(
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            initialDate: _selectedDate,
            onDateSubmitted: (date) {
              print(date);
              setState(() {
                _selectedDate = date;
              });
            },
          ),
          TextField(
            controller: _titleController,
            maxLines: 1,
            decoration: const InputDecoration(labelText: 'title'),
          ),
          TextField(
            controller: _descController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'description'),
          ),
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
          _addEvent();
        },
      ),
    );
  }

  void _addEvent() async {
    final title = _titleController.text;
    final description = _descController.text;
    if (title.isEmpty) {
      print('title cannot be empty');
      return;
    }

    widget.task.title = title;
    widget.task.description = description;
    widget.task.deadline = _selectedDate;

    await db.updateTask(widget.task);

    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}
