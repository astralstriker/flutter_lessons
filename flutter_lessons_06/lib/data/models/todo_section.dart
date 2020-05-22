import 'package:flutter/foundation.dart';
import 'package:flutter_lessons_06/data/models/todo_item.dart';

@immutable
class TodoSection {
  final String title;
  final int id;
  final List<TodoItem> todos;

  TodoSection({
    @required this.title,
    @required this.id,
    @required this.todos,
  });
}
