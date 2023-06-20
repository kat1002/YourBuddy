import 'package:flutter/material.dart';
import 'package:yourbuddy/models/task.dart';
import 'package:yourbuddy/util/add_task.dart';
import 'package:yourbuddy/util/task_data_store.dart';

import '../drawer.dart';
import '../util/edit_task.dart';
import '../widgets/task_item.dart';

class TimeManagement extends StatefulWidget {
  const TimeManagement({super.key});

  @override
  State<TimeManagement> createState() => _TimeManagementState();
}

class _TimeManagementState extends State<TimeManagement> {
  TaskDataStore db = TaskDataStore();

  late List<Task> _tasks;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();

    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 1000));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
    _loadDataFromHive();
  }

  _loadDataFromHive() async {
    final firstDay = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final lastDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);

    _tasks = [];

    List tasks = db.box.values.toList();

    for (var task in tasks) {
      _tasks.add(task);
    }

    setState(() {});
  }

  List<Task> _getTasks() {
    return _tasks.toList();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _globalKey,
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Quản lý thời gian',
          style: TextStyle(color: Color(0xff1f1f1f)),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            _globalKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          ..._getTasks().map(
            (task) => TaskItem(
                task: task,
                onTap: () async {
                  final res = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditTask(
                        firstDate: _firstDay,
                        lastDate: _lastDay,
                        task: task,
                      ),
                    ),
                  );
                  if (res ?? false) {
                    //_loadFirestoreEvents();
                    _loadDataFromHive();
                  }
                },
                onDelete: () async {
                  final delete = await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Delete Event?"),
                      content: const Text("Are you sure you want to delete?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                  if (delete ?? false) {
                    await db.deleteTask(task);
                    _loadDataFromHive();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff643FDB),
        onPressed: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => AddTask(
                firstDate: _firstDay,
                lastDate: _lastDay,
                selectedDate: _focusedDay,
              ),
            ),
          );
          if (result ?? false) {
            //_loadFirestoreEvents();
            //await _loadEventsFromHive();
            _loadDataFromHive();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
