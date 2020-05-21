import 'package:flutter/material.dart';

final Map<Color, String> _colorLabels = {
  Colors.red: "Red",
  Colors.orange: "Orange",
  Colors.amber: "Amber",
  Colors.lightGreen: "Light Green",
  Colors.green: "Green",
  Colors.teal: "Teal",
  Colors.cyan: "Cyan",
  Colors.lightBlue: "Light Blue",
  Colors.blue: "Blue",
  Colors.brown: "Brown",
  Colors.blueGrey: "Blue Grey",
  Colors.pink: "Pink",
  Colors.purple: "Purple",
  Colors.lime: "Lime",
  Colors.indigo: "Indigo",
  Colors.grey: "Grey",
};

class ColorPicker extends StatelessWidget {
  final List<List<Color>> _colors = [
    [
      Colors.red, // 0
      Colors.orange, // 2
      Colors.amber, // 1
      Colors.lightGreen // 3
    ],
    [
      Colors.green, // 4
      Colors.teal, // 5
      Colors.cyan, // 6
      Colors.lightBlue // 7
    ],
    [
      Colors.blue, // 8
      Colors.brown, // 9
      Colors.blueGrey, // 10
      Colors.pink // 11
    ],
    [
      Colors.purple, // 12
      Colors.lime, // 13
      Colors.indigo, // 14
      Colors.grey // 15
    ]
  ];

  List<TableRow> tableRows() =>
      List.generate(4, (index) => TableRow(children: rowChildren(index)));

  List<Widget> rowChildren(int rowIndex) =>
      List.generate(4, (index) => ColorSwatch(color: _colors[rowIndex][index]));

  @override
  Widget build(BuildContext context) {
    return Table(
      children: tableRows(),
    );
  }
}

class ColorSwatch extends StatelessWidget {
  final Color color;

  const ColorSwatch({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell( // or GestureDetector
      onTap: (){
        Navigator.pop(context, color);
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.all(4.0),
        child: Center(
          child: Text(
            _colorLabels[color],
            style: Theme.of(context).textTheme.button,
          ),
        ),
        color: color,
      ),
    );
  }
}
