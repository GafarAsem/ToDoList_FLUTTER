import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list_flutter/Classes/CustomShowDialog.dart';
import 'package:todo_list_flutter/Classes/ToDo.dart';
import 'package:todo_list_flutter/Classes/set_list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_flutter/Scenes/dialog_todo.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDo> todoList;

  List<String> days = [
    'الأثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد'
  ];

  var day=DateTime.now().weekday;

  List<Widget> getDay() {
    todoList.removeWhere((element) => element.dayWeek!=day);
    List<Widget> Days = [];
    for (int i = 0; i < days.length; i++) {
          bool today = day == i+1;
      Days.add(
          Center(
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                day=i+1;
              });
            },
            child: Column(
              children: [
                Text(
                  days[i],
                  style: TextStyle(color: !today ? Colors.grey.shade400 : null),
                ),
                Text((i + 1).toString(),
                    style:
                        TextStyle(color: !today ? Colors.grey.shade400 : null)),
                Container(
                  color: today ? Colors.lightBlue.shade200 : Colors.transparent,
                  width: 30,
                  height: 3,
                ),
              ],
            ),
          ),));

    }
    return Days;
  }

  List<Widget> getListDo() {
    List<Widget> todoes = [];
    for (int i = 0; i < todoList.length; i++)
      todoes.add(
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actions: [
              IconSlideAction(
                caption: 'حذف',
                color: Colors.lightBlueAccent.shade100,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                onTap: () {},
              ),
            ],
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: todoList[i].colorToDo,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      todoList[i].getTime(),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Expanded(
                        child: CheckboxListTile(
                      title: Text(
                        todoList[i].doItem,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 17,
                          color: todoList[i].checked ? Colors.grey : null,
                          decoration: todoList[i].checked
                              ? TextDecoration.lineThrough
                              : null,
                          fontStyle:
                              todoList[i].checked ? FontStyle.italic : null,
                        ),
                      ),
                      value: todoList[i].checked,
                      onChanged: (bool value) {
                        setState(() {
                          value = !todoList[i].checked;
                          todoList[i].checked = value;
                        });
                      },
                    ));
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    return todoes;
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    intl.Intl.defaultLocale = 'ar';
    todoList = getList();
    String DayandMonth = intl.DateFormat('EEEE, MMM d').format(DateTime.now());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        onPressed: () {
          DialogToDo.YYAlertDialogWithDivider(context,day);
        },
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: Text(
                    DayandMonth,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: Text(
                    "اليوم",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: getDay(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: Text(
                      '${todoList.length} مهمة',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: getListDo(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
