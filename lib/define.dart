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

class HabitIcon {
  int id;
  IconData icon;
  Color iconColor;

  HabitIcon(this.id, this.icon, this.iconColor);
}

// 習慣登録で使用可能なカラー集
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

// 習慣登録で使用可能なアイコン集
List<HabitIcon> getAvailableHabitIcons() {
  var habitIcons = new List<HabitIcon>();
  habitIcons.add(new HabitIcon(1, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(2, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(3, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(4, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(5, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(6, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(7, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(8, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(9, Icons.directions_walk, Colors.grey));
  habitIcons.add(new HabitIcon(10, Icons.directions_walk, Colors.grey));
  return habitIcons;
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
