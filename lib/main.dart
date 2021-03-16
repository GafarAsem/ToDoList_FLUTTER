import 'package:flutter/material.dart';
import 'package:todo_list_flutter/Classes/set_list.dart';
import 'Classes/ToDo.dart';
import 'Scenes/home_scene.dart';

void main() {

  runApp(MyApp());


}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' ادارة المهام',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        accentColor: Colors.lightBlueAccent.shade100,
        primarySwatch:Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

