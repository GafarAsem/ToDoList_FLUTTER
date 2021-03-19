
import 'package:flutter/material.dart';
import 'package:todo_list_flutter/Classes/ToDo.dart';

List<ToDo> getList(){
  List<ToDo> list=[];
  list.add(ToDo(doItem: "Go to shopping",colorToDo:Colors.red.shade100.value,dayWeek: DateTime.now().weekday));
  list.add(ToDo(doItem:"حضور مباراة الاتحاد",colorToDo:Colors.grey.shade200.value,dayWeek: DateTime.now().weekday));
  list.add(ToDo(doItem:"مذاكرة فيزياء",colorToDo:Colors.blue.shade100.value,dayWeek:2));
  list.add(ToDo(doItem:"programming",colorToDo:Colors.green.shade100.value,dayWeek: 2));
  list.add(ToDo(doItem:"Go to shopping",colorToDo:Colors.yellow.shade100.value,dayWeek: DateTime.now().weekday));
  list.add(ToDo(doItem:"حضور مباراة الاتحاد",colorToDo:Colors.blue.shade100.value,dayWeek: 5));
  list.add(ToDo(doItem:"مذاكرة فيزياء",colorToDo:Colors.red.shade100.value,dayWeek: 5));
  list.add(ToDo(doItem:"السلام عليكم ورحمة اللله وبركاته",colorToDo:Colors.grey.shade200.value,dayWeek: DateTime.now().weekday));
  return list;
}