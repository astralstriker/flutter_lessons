import 'dart:convert';

import 'package:flutter/material.dart' show Colors;
import 'package:flutter_lessons_06/data/datasource/local/shared_pref_helper.dart';
import 'package:flutter_lessons_06/data/models/app_settings.dart';

abstract class ISettingsRepository {
  Future<AppSettings> readSettingsFromDisk();
  Future<bool> saveSettingsToDisk(AppSettings settings);
}

class SettingsRepository implements ISettingsRepository {
  SettingsRepository._(this._prefHelper);

  static SettingsRepository _instance;

  factory SettingsRepository(SharedPrefHelper prefHelper) {
    _instance ??= SettingsRepository._(prefHelper);
    return _instance;
  }

  final ISharedPrefHelper _prefHelper;

  static const SETTINGS_KEY = "settings";

  @override
  Future<AppSettings> readSettingsFromDisk() async {
    final settingsJson = await _prefHelper.get(key: SETTINGS_KEY);
    if (settingsJson == null) {
      return AppSettings(
          primaryColor: 0xFFFF9800,
          backgroundColor: 0xFFFFFFFF,
          tabBarPosition: TabBarPosition.BOTTOM);
    }
    return AppSettings.fromJson(json.decode(settingsJson) as Map);
  }

  @override
  Future<bool> saveSettingsToDisk(AppSettings settings) => _prefHelper.save(
      key: SETTINGS_KEY, value: json.encode(settings.toJson()));
}
