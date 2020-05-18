import 'package:flutter/material.dart';
import 'package:flutter_lessons_02/data/models/todo_item.dart';
import 'package:flutter_lessons_02/data/models/todo_section.dart';
import 'package:intl/intl.dart';

// Widgets are immutable, it means that none of their properties can be non-final
class HeaderRow extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const HeaderRow({Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.0, left: 40,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          DecoratedBox(
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  color: Colors.orange[600].withOpacity(0.4),
                  blurRadius: 4,
                  spreadRadius: -3,
                  offset: Offset(0, 0))
            ]),
            child: MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: onPressed,
              child: Icon(Icons.add),
              shape: CircleBorder(),
            ),
          )
        ],
      ),
    );
  }
}

class TodoListItem extends StatefulWidget {
  final TodoItem todo;

  const TodoListItem({Key key, @required this.todo})
      : super(key: key);

  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool _isChecked = false;

  void onChanged(bool state) {
    setState(() {
      _isChecked = state;
    });
  }

  @override
  void initState() {
    // Called only once in a lifecycle of a stateful widget
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 44, top: 4, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: _isChecked,
                onChanged: onChanged,
                activeColor: Theme.of(context).primaryColor,
                focusColor: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              Text(
                '${widget.todo.title}',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      decoration: _isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: _isChecked ? Colors.grey : Colors.black,
                    ),
              ),
            ],
          ),
          Text(
            '${DateFormat(DateFormat.HOUR_MINUTE).format(widget.todo.time)}', // DateFormat is a part of intl package
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}

class TodoSectionWidget extends StatelessWidget {
  final TodoSection section;

  const TodoSectionWidget({Key key, this.section}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderRow(title: section.title, onPressed: () {}),
        SizedBox(height: 16,),
        ...section.todos.map((todo) => TodoListItem(todo: todo)),
      ],
    );
  }
}
