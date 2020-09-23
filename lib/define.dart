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

// 習慣登録用ハイパーパラメーター
class HabitColor {
  int id;
  Color color;
  Color buttonColor;

  HabitColor(this.id, this.color, this.buttonColor);
}

List<HabitColor> getAvailableHabitColors() {
  var habitColors = new List<HabitColor>();
  habitColors.add(new HabitColor(1, Colors.blue[200], Colors.blue));
  habitColors.add(new HabitColor(2, Colors.green[200], Colors.green));
  habitColors.add(new HabitColor(3, Colors.red[200], Colors.red));
  habitColors.add(new HabitColor(4, Colors.yellow[200], Colors.yellow));
  habitColors.add(new HabitColor(5, Colors.orange[200], Colors.orange));
  habitColors.add(new HabitColor(6, Colors.pink[200], Colors.pink));
  habitColors.add(new HabitColor(7, Colors.purple[200], Colors.purple));
  return habitColors;
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
