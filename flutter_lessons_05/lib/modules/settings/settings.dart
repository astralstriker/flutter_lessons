import 'package:flutter/material.dart';
import 'package:flutter_lessons_05/main.dart';
import 'package:flutter_lessons_05/data/models/app_settings.dart';
import 'package:flutter_lessons_05/modules/settings/widgets.dart';

import '../../main.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AppSettings _settings = AppSettings(
    primaryColor: Colors.orange.value,
    backgroundColor: Colors.blue.value,
    tabBarPosition: TabBarPosition.BOTTOM,
  );

  void openColorPicker() {
    showModalBottomSheet<Color>(context: context, builder: (_) => ColorPicker())
        .then((Color color) {
      if (color != null) {
        _settings = _settings.copyWith(primaryColor: color.value);
        appKey.currentState
            .setTheme(Theme.of(context).copyWith(primaryColor: color, unselectedWidgetColor: color.withOpacity(0.5)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Theme Color'),
            trailing: InkWell(
              onTap: openColorPicker,
              child: Container(
                height: 48,
                width: 48,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          ListTile(
            title: Text('Background Color'),
            trailing: InkWell(
              child: Container(
                height: 48,
                width: 48,
                color: Color(_settings.backgroundColor),
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
