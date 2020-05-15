import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => HomeState(); // lambda notation
}

class HomeState extends State<Home> {
  int counter = 0;

  void incrementCounter() { // That's it for today folks!
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health-19'), 
      ),
      body: Center(
        child: Text(counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        incrementCounter();
      }, child: Icon(Icons.add),),
    );
  }
}