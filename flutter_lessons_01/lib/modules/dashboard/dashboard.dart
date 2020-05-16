import 'package:flutter/material.dart';
import 'package:flutter_lessons_01/modules/dashboard/widgets.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      body: Column(
        children: <Widget>[
          HeaderRow(title: "Today", onPressed: (){}),
          TodoListItem(title: "Wake Up", time: DateTime.now(),),
        ],
      ),
    );
  }
}
