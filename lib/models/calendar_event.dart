class Calendar_Event {
  String? dateOfEvent;
  List<Cal_Event>? events;

  Calendar_Event({this.dateOfEvent, this.events});

  Calendar_Event.fromJson(Map<String, dynamic> json) {
    dateOfEvent = json['date'];
    if (json['events'] != null) {
      events = <Cal_Event>[];
      (json['events'] as List).forEach((e) {
        events!.add(Cal_Event.fromJson(e));
      });
    }
  }

  Map<String, dynamic> toJson() => {'date': dateOfEvent, 'events': events};
}

class Cal_Event {
  String? title;
  String? descp;

  Cal_Event({this.title, this.descp});

  Cal_Event.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    descp = json['descp'];
  }

  Map<String, dynamic> toJson() => {'title': title, 'descp': descp};
}
