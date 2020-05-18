import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lessons_02/modules/dashboard/index.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primaryColor: Colors.orange,
        unselectedWidgetColor: Colors.orange.withOpacity(0.5),
      ),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
