import 'package:flutter/material.dart';
import 'package:flutter_lessons_02/data/models/todo_section.dart';
import 'package:flutter_lessons_02/modules/dashboard/widgets.dart';
import 'package:flutter_lessons_02/data/models/todo_item.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _todaysTodoSection = TodoSection(
      title: "Today",
      id: 0,
      todos: List.generate(
          6,
          (index) => TodoItem(
              id: index,
              title: "Item ${index + 1}",
              time: DateTime.now(),
              selected: false)));
  final _tomorrowsTodoSection = TodoSection(
      title: "Tomorrow",
      id: 1,
      todos: List.generate(
          6,
          (index) => TodoItem(
              id: index,
              title: "Item ${index + 1}",
              time: DateTime.now(),
              selected: false)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54),
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TodoSectionWidget(
                section: _todaysTodoSection,
              ),
              SizedBox(height: 24,),
              TodoSectionWidget(
                section: _tomorrowsTodoSection,
              ),
            ],
          ),
        ));
  }
}
