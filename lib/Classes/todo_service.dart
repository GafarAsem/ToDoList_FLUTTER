

import 'package:todo_list_flutter/Classes/repository.dart';

import 'ToDo.dart';

class ToDoService{

  Repository _repository;

  ToDoService(){
    _repository=Repository();
  }

  saveToDo(ToDo todo) async {
    return await _repository.insertToDo('ToDo', todo.toMap());
  }
}