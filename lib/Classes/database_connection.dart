import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list_flutter/Classes/ToDo.dart';

class DataBaseConnection {


    setDataBase() async {

      var directory = await getApplicationDocumentsDirectory();
      var path = join(directory.path, "db_ToDo");
      var dataBase = await openDatabase(
          path, version: 1, onCreate: _onCreatingDataBase);
      return dataBase;


    }

    _onCreatingDataBase(Database database, int version) async {
      String sqlExecute = "CREATE TABLE ToDo("
          "id TEXT PRIMARY KEY , "
          "doItem TEXT,"
          "checked INTEGER,"
          " colorToDo INTEGER , "
          "dateTime DATETIME ,"
          " dayWeek INTEGER )";
      await database.execute(sqlExecute);
    }
}
