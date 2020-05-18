import 'package:flutter/foundation.dart';

@immutable
class TodoItem {
  final int id;
  final String title;
  final DateTime time;
  final bool selected;

  TodoItem({
    @required this.id,
    @required this.title,
    @required this.time,
    @required this.selected,
  });

  TodoItem copyWith({
    final String title,
    final DateTime time,
    final bool selected,
  }) =>
      TodoItem(
          id: this.id,
          title: title ?? this.title,
          time: time ?? this.time,
          selected: selected ?? this.selected);
}
