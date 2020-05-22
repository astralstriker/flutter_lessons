import 'package:flutter/material.dart';
import 'package:flutter_lessons_06/data/datasource/repository/settings_repository.dart';
import 'package:flutter_lessons_06/main.dart';
import 'package:flutter_lessons_06/data/models/app_settings.dart';
import 'package:flutter_lessons_06/modules/settings/widgets.dart';

import '../../main.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void openColorPicker(AppSettings settings) {
    showModalBottomSheet<Color>(context: context, builder: (_) => ColorPicker())
        .then((Color color) {
      if (color != null) {
        _settingsRepository
            .saveSettingsToDisk(settings.copyWith(primaryColor: color.value))
            .then((_) {
          appKey.currentState.setTheme(Theme.of(context).copyWith(
              primaryColor: color,
              unselectedWidgetColor: color.withOpacity(0.5)));
        });
      }
    });
  }

  void openBackgroundColorPicker(AppSettings settings) {
    showModalBottomSheet<Color>(context: context, builder: (_) => ColorPicker())
        .then((Color color) {
      if (color != null) {
        _settingsRepository
            .saveSettingsToDisk(settings.copyWith(backgroundColor: color.value))
            .then((_) {
          appKey.currentState.setTheme(Theme.of(context).copyWith(
            backgroundColor: color,
          ));
        });
      }
    });
  }

  ISettingsRepository _settingsRepository;
  @override
  void initState() {
    super.initState();
    _settingsRepository = appKey.currentState.settingsRepository;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppSettings>(
        future: _settingsRepository.readSettingsFromDisk(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }

          final _settings = snapshot.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Theme Color'),
                  trailing: InkWell(
                    onTap: () {
                      openColorPicker(_settings);
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      color: Color(_settings.primaryColor),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Background Color'),
                  trailing: InkWell(
                    onTap: (){
                      openBackgroundColorPicker(_settings);
                    },
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
                      child: Text(
                          _settings.tabBarPosition == TabBarPosition.BOTTOM
                              ? "Bottom"
                              : "Top"),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
