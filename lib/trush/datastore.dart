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
        "CREATE TABLE habits("
        "uuid TEXT PRIMARY KEY,"
        "title TEXT,"
        "colorhash INTEGER,"
        "iconcodepoint INTEGER,"
        "archived INTEGER,"
        "parentuuid TEXT,"
        "datestr TEXT,"
        "datetime TEXT,"
        "score INTEGER"
        ")",
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
  final List<Map<String, dynamic>> maps = await db.query(
    'habits',
    where: 'parentuuid = ?', // parent_uuid = 0 は Habitの設定値エントリ
    whereArgs: ['0'],
  );

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

// 新しい記録を追加する
Future<void> insertHistory(String parentuuid, History history) async {
  final Database db = await database;
  await db.insert(
    'habits',
    convertFromHistoryToSQL(parentuuid, history).toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// 登録済みのすべての記録を取得する
Future<List<History>> getHistory(String parentuuid) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'habits',
    where: 'parentuuid = ?',
    whereArgs: [parentuuid],
  );

  return List.generate(maps.length, (i) {
    return convertFromSQLToHistory(new HistoryForSQL(
      maps[i]['parentuuid'],
      maps[i]['dateStr'],
      maps[i]['datetime'],
      maps[i]['score'],
    ));
  });
}

// 登録済みの登録の設定値を変更する
Future<void> updateHistory(String parentuuid, History history) async {
  final db = await database;
  var sql = convertFromHistoryToSQL(parentuuid, history);
  await db.update(
    'habits',
    sql.toMap(),
    where: "parentuuid = ? and datestr = ?",
    whereArgs: [sql.parentuuid, sql.dateStr],
  );
}
