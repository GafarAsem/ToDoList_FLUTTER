

import 'package:sqflite/sqflite.dart';
import 'package:todo_list_flutter/Classes/database_connection.dart';

class Repository {

  DataBaseConnection _baseConnection;
  static Database _database;

  Repository(){
    _baseConnection=DataBaseConnection();
  }

  Future<Database>  get database async{

    if(_database!=null) return _database;

    //if Null
    _database =await _baseConnection.setDataBase();
    return _database;

  }

  insertToDo(table,toDo) async {
    var connection =await database;
    return await connection.insert(table, toDo);
  }

  queryToDo(table) async {
    var connection =await database;
    return await connection.query(table);
  }





}