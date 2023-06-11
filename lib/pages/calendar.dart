import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  final titleController = TextEditingController();
  final desController = TextEditingController();
  Map<String, List> mySelectedEvents = {};

  @override
  void initState() {
    //if()
    super.initState();
    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2023-06-11": [
        {"eventDescp": "11", "eventTitle": "111"},
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2023-06-12": [
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2023-06-13": [
        {"eventTitle": "ss", "eventDescp": "ss"}
      ]
    };
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                'Thêm sự kiện',
                textAlign: TextAlign.center,
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'Tên',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff643FDB),
                            width: 2.0,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff643FDB),
                            width: 2.0,
                          )),
                    ),
                  ),
                  TextField(
                    controller: desController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Nội dung',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff643FDB),
                            width: 2.0,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Color(0xff643FDB),
                            width: 2.0,
                          )),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
                TextButton(
                  child: const Text('Done'),
                  onPressed: () {
                    if (titleController.text.isEmpty &&
                        desController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Không được bỏ trống tên và nội dung'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      return;
                    } else {
                      if (mySelectedEvents[
                              DateFormat('yyyy-MM-dd').format(today)] !=
                          null) {
                        mySelectedEvents[DateFormat('yyyy-MM-dd').format(today)]
                            ?.add({
                          "eventTitle": titleController.text,
                          "eventDes": desController.text,
                        });
                      } else {
                        mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(today)] = [
                          {
                            "eventTitle": titleController.text,
                            "eventDes": desController.text,
                          }
                        ];
                      }

                      print(
                          'New ev for backend dev ${json.encode(mySelectedEvents)}');
                      titleController.clear();
                      desController.clear();
                      Navigator.pop(context);
                      return;
                    }
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          'Lịch biểu',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Container(
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2040, 10, 16),
              onDaySelected: _onDaySelected,
              eventLoader: _listOfDayEvents,
            ),
          ),
          ..._listOfDayEvents(today).map(
            (myEvents) => ListTile(
              leading: const Icon(
                Icons.done,
                color: Colors.teal,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Event Title:   ${myEvents['eventTitle']}'),
              ),
              subtitle: Text('Description:   ${myEvents['eventDescp']}'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        label: const Text('+'),
        backgroundColor: Color(0xff643FDB),
      ),
    );
  }
}
