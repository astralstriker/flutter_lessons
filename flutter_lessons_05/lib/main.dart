import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lessons_05/modules/dashboard/index.dart';

final appKey = GlobalKey<MyAppState>();

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(MyApp(key: appKey));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}


class MyAppState extends State<MyApp> {
  ThemeData _themeData = ThemeData(
    primaryColor: Colors.orange,
    primaryColorDark: Colors.orange[700],
    unselectedWidgetColor: Colors.orange.withOpacity(0.5),
  );

  void setTheme(ThemeData data) => setState(() => _themeData = data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      title: 'Todo App',
      theme: _themeData,
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
