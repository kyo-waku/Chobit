import 'package:flutter/material.dart';

class Habit {
  String title;
  Color color;
  IconData icon;

  Habit(this.title, this.color, this.icon);
}

String dateTimeFormatter(DateTime date) {
  return '${date.year} / ${date.month} / ${date.day}';
}

// テスト用初期値
Habit initialHabit = new Habit(
  'testBlue',
  Colors.blue[200],
  Icons.directions_run,
);

Habit initialHabit2 = new Habit(
  'testGreen',
  Colors.green[200],
  Icons.directions_bike,
);

Habit initialHabit3 = new Habit(
  'testOrange',
  Colors.orange[200],
  Icons.directions_transit,
);
