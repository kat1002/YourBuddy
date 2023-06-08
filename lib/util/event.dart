import 'package:flutter/material.dart';

class Event {
  String title;
  String description;
  DateTime dateOfEv = DateTime.now();
  DateTime endEv = DateTime.now();

  Event(this.title, this.description, this.dateOfEv, this.endEv);
}
