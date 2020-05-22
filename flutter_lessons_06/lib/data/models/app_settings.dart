import 'package:flutter/foundation.dart';

@immutable
class AppSettings {
  final int primaryColor;
  final int backgroundColor;
  final TabBarPosition tabBarPosition;

  const AppSettings({
    @required this.primaryColor,
    @required this.backgroundColor,
    @required this.tabBarPosition,
  });

  AppSettings copyWith({final int primaryColor, final int backgroundColor,
          final TabBarPosition tabBarPosition}) =>
      AppSettings(
        primaryColor: primaryColor ?? this.primaryColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        tabBarPosition: tabBarPosition ?? this.tabBarPosition,
      );
  // I/O - Input/Output
  // Serialization : Convert binary to text
  Map<String, int> toJson() => <String, int>{
        "primaryColor": this.primaryColor,
        "backgroundColor": this.backgroundColor,
        "tabBarPosition": this.tabBarPosition.index,
      };

  // Deserialization : Convert text to binary
  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
        primaryColor: json["primaryColor"] as int,
        backgroundColor: json["backgroundColor"] as int,
        tabBarPosition: TabBarPosition.values[json["tabBarPosition"] as int],
      );
}

enum TabBarPosition { TOP, BOTTOM }

