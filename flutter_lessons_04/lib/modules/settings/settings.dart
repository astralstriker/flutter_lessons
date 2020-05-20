import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Theme Color'),
            trailing: InkWell(
              child: Container(
                height: 48,
                width: 48,
                color: Colors.orange,
              ),
            ),
          ),
          ListTile(
            title: Text('Background Color'),
            trailing: InkWell(
              child: Container(
                height: 48,
                width: 48,
                color: Colors.blue,

              ),
            ),
          ),
          ListTile(
            title: Text('Appbar Position'),
            trailing: InkWell(
              child: Container(
                height: 48,
                width: 48,
                color: Colors.green,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
