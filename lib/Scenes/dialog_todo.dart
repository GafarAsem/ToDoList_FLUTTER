import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:todo_list_flutter/Classes/CustomShowDialog.dart';
import 'package:todo_list_flutter/Classes/ToDo.dart';
import 'package:todo_list_flutter/Classes/todo_service.dart';
import 'package:todo_list_flutter/Scenes/home_scene.dart';

int dayweek;
TextEditingController _controller = TextEditingController();
Color choice = Colors.grey.shade200;

class ToDoDialog extends StatefulWidget {
  int dayWeek = 1;

  ToDoDialog(this.dayWeek);

  @override
  _ToDoDialogState createState() => _ToDoDialogState(dayWeek);
}

class _ToDoDialogState extends State<ToDoDialog> {
  _ToDoDialogState(dayWeek) {
    dayweek = dayWeek;
  }

  List<Color> colorToDo = [
    Colors.red.shade200,
    Colors.blue.shade200,
    Colors.green.shade200,
    Colors.yellow.shade200,
    Colors.grey.shade200,
  ];

  List<Widget> choiceColor() {
    List<Widget> colorElements = [];
    colorToDo.forEach((element) {
      colorElements.add(
        GestureDetector(
          onTapDown: (_) {
            setState(() {
              choice = element;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: choice == element ? Colors.blueAccent : null,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: element,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
            ),
          ),
        ),
      );
    });

    return colorElements;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: MediaQuery.of(context).size.height/5,
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              autofocus: true,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                suffixText: '????????????',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLength: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: choiceColor(),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogToDo {
  static YYDialog YYAlertDialogWithDivider(BuildContext context, int Day) {
    return YYDialog().build(context)
      ..width = MediaQuery.of(context).size.width - 50
      ..borderRadius = 20
      ..text(
        padding: EdgeInsets.all(25.0),
        alignment: Alignment.topRight,
        text: "?????????? ????????",
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      )
      ..widget(ToDoDialog(Day))
      ..doubleButton(
        withDivider: true,
        gravity: Gravity.center,
        text2: "????",
        color2: Colors.black,
        fontSize2: 17.0,
        fontWeight2: FontWeight.bold,
        onTap2: () async {
          ToDo toDo = ToDo(
            doItem: _controller.text,
            colorToDo: choice.value,
            dayWeek: dayweek,
          );
          ToDoService _Service = ToDoService();
          print(await _Service.saveToDo(toDo));

        },
        text1: "??????????",
        color1: Colors.grey,
        fontSize1: 17.0,
        fontWeight1: FontWeight.bold,
        onTap1: () {},
      )
      ..show();
  }
}
