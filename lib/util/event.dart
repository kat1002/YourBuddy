import 'package:flutter/material.dart';

class Event {
  String title;
  String description;
  DateTime dateOfEv = DateTime.now();

  Event(this.title, this.description, this.dateOfEv);
}
