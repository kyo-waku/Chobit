import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Habit {
  String uuid; // 習慣ごとのユニークなID
  String title; // 習慣のタイトル
  Color color; // カラー
  IconData icon; // アイコン
  bool archived; // アーカイブステータス (true: アーカイブ, false: 使用可能)
  List<History> histories; // 習慣の実施記録

  Habit(this.uuid, this.title, this.color, this.icon, this.archived, this.histories);
}

// データベース登録用のデータ構造
class HabitForSQL {
  String uuid;
  String title;
  int colorhash;
  int iconcodepoint;
  int archived; // 0: false, 1: true

  HabitForSQL(this.uuid, this.title, this.colorhash, this.iconcodepoint, this.archived);

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'title': title,
      'colorhash': colorhash,
      'iconcodepoint': iconcodepoint,
      'archived': archived,
      'parentuuid': 0, // 設定情報は parent_uuid = 0
    };
  }
}

// 内部処理用からSQL登録用に切り替える
HabitForSQL convertFromHabitToSQL(Habit habit) {
  int arc = habit.archived ? 1 : 0;
  return new HabitForSQL(
    habit.uuid,
    habit.title,
    habit.color.hashCode,
    habit.icon.codePoint,
    arc,
  );
}

// SQLのデータから内部処理用に切り替える
Habit convertFromSQLToHabit(HabitForSQL sql) {
  bool arc = (sql.archived == 1) ? true : false;
  return new Habit(
    sql.uuid,
    sql.title,
    Color(sql.colorhash),
    IconData(sql.iconcodepoint, fontFamily: 'MaterialIcons'),
    arc,
    null,
  );
}

// 実施記録
class History {
  String dateStr;
  DateTime dateTime;
  Score score;
  History(this.dateTime, this.score) {
    dateStr = this.dateTime.year.toString() + this.dateTime.month.toString() + this.dateTime.day.toString();
  }
}

// 実施記録 for SQL
class HistoryForSQL {
  String parentuuid;
  String dateStr;
  String dateTime;
  int score;
  HistoryForSQL(this.parentuuid, this.dateStr, this.dateTime, this.score);

  Map<String, dynamic> toMap() {
    return {
      'uuid': Uuid().v1(),
      'parentuuid': parentuuid,
      'datestr': dateStr,
      'datetime': dateTime,
      'score': score,
    };
  }
}

// 内部処理用からSQL登録用に切り替える
HistoryForSQL convertFromHistoryToSQL(String parentuuid, History history) {
  String datetimestring = history.dateTime.toUtc().toIso8601String();
  String dateStr = history.dateTime.year.toString() + history.dateTime.month.toString() + history.dateTime.day.toString();
  int scoreint = history.score.index;
  return new HistoryForSQL(
    parentuuid,
    dateStr,
    datetimestring,
    scoreint,
  );
}

// SQLのデータから内部処理用に切り替える
History convertFromSQLToHistory(HistoryForSQL sql) {
  DateTime dateTime = DateTime.parse(sql.dateTime).toLocal();
  Score score = Score.values[sql.score];
  return new History(
    dateTime,
    score,
  );
}

// スコア列
enum Score { Nan, Excellent, Nice, Chobit, Break }

// 便利関数
bool isSameDate(DateTime src, DateTime trg) {
  return (src.year == trg.year && src.month == trg.month && src.day == trg.day);
}

String dateTimeFormatter(DateTime date) {
  return '${date.year}/${date.month}/${date.day}';
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
  habitIcons.add(new HabitIcon(1, Icons.directions_walk, Colors.blueGrey));
  habitIcons.add(new HabitIcon(2, Icons.directions_run, Colors.blueGrey));
  habitIcons.add(new HabitIcon(3, Icons.directions_bike, Colors.blueGrey));
  habitIcons.add(new HabitIcon(4, Icons.alarm_on, Colors.blueGrey));
  habitIcons.add(new HabitIcon(5, Icons.audiotrack, Colors.blueGrey));
  habitIcons.add(new HabitIcon(6, Icons.color_lens, Colors.blueGrey));
  habitIcons.add(new HabitIcon(7, Icons.build, Colors.blueGrey));
  habitIcons.add(new HabitIcon(8, Icons.card_travel, Colors.blueGrey));
  habitIcons.add(new HabitIcon(9, Icons.cake, Colors.blueGrey));
  habitIcons.add(new HabitIcon(10, Icons.camera_alt, Colors.blueGrey));
  habitIcons.add(new HabitIcon(11, Icons.card_giftcard, Colors.blueGrey));
  habitIcons.add(new HabitIcon(12, Icons.child_friendly, Colors.blueGrey));
  habitIcons.add(new HabitIcon(13, Icons.computer, Colors.blueGrey));
  habitIcons.add(new HabitIcon(14, Icons.create, Colors.blueGrey));
  habitIcons.add(new HabitIcon(15, Icons.attach_money, Colors.blueGrey));
  habitIcons.add(new HabitIcon(16, Icons.fastfood, Colors.blueGrey));
  habitIcons.add(new HabitIcon(17, Icons.filter_hdr, Colors.blueGrey));
  habitIcons.add(new HabitIcon(18, Icons.filter_vintage, Colors.blueGrey));
  habitIcons.add(new HabitIcon(19, Icons.fitness_center, Colors.blueGrey));
  habitIcons.add(new HabitIcon(20, Icons.free_breakfast, Colors.blueGrey));
  habitIcons.add(new HabitIcon(21, Icons.headset_mic, Colors.blueGrey));
  habitIcons.add(new HabitIcon(22, Icons.hearing, Colors.blueGrey));
  habitIcons.add(new HabitIcon(23, Icons.hot_tub, Colors.blueGrey));
  habitIcons.add(new HabitIcon(24, Icons.local_bar, Colors.blueGrey));
  habitIcons.add(new HabitIcon(25, Icons.import_contacts, Colors.blueGrey));
  habitIcons.add(new HabitIcon(26, Icons.insert_emoticon, Colors.blueGrey));
  habitIcons.add(new HabitIcon(27, Icons.local_florist, Colors.blueGrey));
  habitIcons.add(new HabitIcon(28, Icons.local_grocery_store, Colors.blueGrey));
  habitIcons.add(new HabitIcon(29, Icons.local_movies, Colors.blueGrey));
  habitIcons.add(new HabitIcon(30, Icons.pets, Colors.blueGrey));
  habitIcons.add(new HabitIcon(31, Icons.public, Colors.blueGrey));
  habitIcons.add(new HabitIcon(32, Icons.restaurant, Colors.blueGrey));
  habitIcons.add(new HabitIcon(33, Icons.school, Colors.blueGrey));
  habitIcons.add(new HabitIcon(34, Icons.local_car_wash, Colors.blueGrey));
  habitIcons.add(new HabitIcon(35, Icons.wc, Colors.blueGrey));

  return habitIcons;
}
