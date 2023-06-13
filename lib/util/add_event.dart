import 'package:flutter/material.dart';
import 'package:yourbuddy/models/event.dart';
import 'package:yourbuddy/util/event_data_store.dart';

class AddEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? selectedDate;
  const AddEvent(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      this.selectedDate})
      : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late DateTime _selectedDate;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  EventDataStore db = EventDataStore();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tạo hoạt động',
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
              _addEvent();
            },
          ),
        ),
        ListView(
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
      ]),
    );
  }

  void _addEvent() async {
    final title = _titleController.text;
    final description = _descController.text;
    if (title.isEmpty) {
      print('title cannot be empty');
      return;
    }

    await db.createEvent(
        Event.create(title: title, descp: description, date: _selectedDate));

    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}
