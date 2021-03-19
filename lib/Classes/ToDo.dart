import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ToDo {
  String id;
  String doItem;
  int checked;
  int colorToDo;
  DateTime dateTime;
  int dayWeek;


  ToDo(
      {this.doItem,
      this.colorToDo,
      this.dayWeek,
      this.checked = 0,}) {
    this.dateTime=DateTime.now();
    id = Uuid().v4();
    dateTime.add(new Duration(days: dayWeek - dateTime.weekday));
  }

  ToDo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    doItem = map['doItem'];
    checked = map['checked'];

    colorToDo = map['colorToDo'];
    dayWeek = map['dayWeek'];
    //dateTime = DateTime.parse(map['dateTime']);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'doItem': doItem,
      'checked': checked,
      'colorToDo': colorToDo,
      'dayWeek': dayWeek,
      'dateTime': DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime),
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  String getTime() {
    String time = DateFormat('jm').format(DateTime.now());

    return time;
  }

  String GetDayMonth() {
    String time = DateFormat('EEEE, MMM d').format(DateTime.now());
    return time;
  }
}
