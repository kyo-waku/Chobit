import 'define.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// 習慣を管理するためのデータベース（実施記録は別）
final Future<Database> database = getDatabasesPath().then((String path) {
  return openDatabase(
    join(path, 'chobits.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE habits(uuid TEXT PRIMARY KEY, title TEXT, colorhash INTEGER, iconcodepoint INTEGER, archived INTEGER)",
      );
    },
    version: 1,
  );
});

// 新しい習慣を追加する
Future<void> insertHabit(Habit habit) async {
  final Database db = await database;
  await db.insert(
    'habits',
    convertFromHabitToSQL(habit).toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// 作成済みのすべての習慣を取得する
Future<List<Habit>> getHabits() async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query('habits');

  return List.generate(maps.length, (i) {
    return convertFromSQLToHabit(new HabitForSQL(
      maps[i]['uuid'],
      maps[i]['title'],
      maps[i]['colorhash'],
      maps[i]['iconcodepoint'],
      maps[i]['archived'],
    ));
  });
}

// 登録済みの習慣の設定値を変更する
Future<void> updateHabit(Habit habit) async {
  final db = await database;
  var sql = convertFromHabitToSQL(habit);
  await db.update(
    'habits',
    sql.toMap(),
    where: "uuid = ?",
    whereArgs: [sql.uuid],
  );
}

// 登録済みの習慣をデータベースから削除する
Future<void> deleteHabit(String uuid) async {
  final db = await database;
  await db.delete(
    'habits',
    where: "uuid = ?",
    whereArgs: [uuid],
  );
}
