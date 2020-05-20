import 'package:flutter/foundation.dart';

abstract class ISharedPrefHelper {
  Future<bool> save({@required String key, @required String value});
  Future<bool> delete({@required String key});
  Future<bool> clearAll();
}

// {key : value}

// an abstract class with all members functions as abstract is called an Interface.
