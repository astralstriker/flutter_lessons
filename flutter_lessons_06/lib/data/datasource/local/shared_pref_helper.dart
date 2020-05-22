import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISharedPrefHelper {
  Future<bool> save({@required String key, @required String value});
  Future<String> get({@required String key});
  Future<bool> delete({@required String key});
  Future<bool> clearAll();
}

class SharedPrefHelper implements ISharedPrefHelper {
  SharedPrefHelper._();

  static SharedPrefHelper _instance;

  factory SharedPrefHelper() {
    _instance ??= SharedPrefHelper._();
    return _instance;
  }

  @override
  Future<bool> clearAll() =>
      SharedPreferences.getInstance().then((prefs) => prefs.clear());

  @override
  Future<bool> delete({String key}) =>
      SharedPreferences.getInstance().then((prefs) => prefs.remove(key));

  @override
  Future<String> get({String key}) =>
      SharedPreferences.getInstance().then((prefs) => prefs.getString(key));

  @override
  Future<bool> save({String key, String value}) =>
      SharedPreferences.getInstance()
          .then((prefs) => prefs.setString(key, value));
}
