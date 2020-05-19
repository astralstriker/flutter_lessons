import 'package:flutter/material.dart';
import 'package:flutter_lessons_03/data/models/todo_section.dart';
import 'package:flutter_lessons_03/modules/dashboard/widgets.dart';
import 'package:flutter_lessons_03/data/models/todo_item.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // a way to access the state of a stateful widget in the widget tree

  void _onDrawerIconPressed() {
    if (_scaffoldKey.currentState.hasDrawer &&
        !_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: DecoratedBox(
          decoration:
              BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColorDark,
                spreadRadius: -4.0,
                blurRadius: 16.0)
          ]),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            indicator: UnderlineTabIndicator(),
            tabs: [
              Tab(
                icon: Icon(Icons.check_circle_outline),
                text: "Tasks",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 28.0), // call kar
            child: IconButton(
                icon: Icon(Icons.menu), onPressed: _onDrawerIconPressed),
          ),
        ),
        drawer: Drawer(),
        body: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.right,
          color: Colors.orangeAccent,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    TodoSectionWidget(
                      section: _todaysTodoSection,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TodoSectionWidget(
                      section: _tomorrowsTodoSection,
                    ),
                  ],
                ),
              ),
              Container(),
            ],
          ),
        ));
  }
}
