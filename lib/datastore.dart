import 'define.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final Future<Database> database = getDatabasesPath().then((String path) {
  return openDatabase(
    join(path, 'chobit_record.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE habits(id INTEGER PRIMARY KEY, title TEXT, colorhash INTEGER, iconcodepoint INTEGER)",
      );
    },
    version: 1,
  );
});

Future<void> insertHabit(Habit habit) async {
  final Database db = await database;
  await db.insert(
    'habits',
    convertFromHabitToSQL(habit).toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Habit>> getHabits() async {
  final Database db = await database;
  // Query the table for all The Habits.
  final List<Map<String, dynamic>> maps = await db.query('habits');

  // Convert the List<Map<String, dynamic> into a List<Habit>.
  return List.generate(maps.length, (i) {
    return convertFromSQLToHabit(new HabitForSQL(
      maps[i]['id'],
      maps[i]['title'],
      maps[i]['colorhash'],
      maps[i]['iconcodepoint'],
    ));
  });
}

Future<void> updateHabit(Habit habit) async {
  final db = await database;
  var sql = convertFromHabitToSQL(habit);
  await db.update(
    'habits',
    sql.toMap(),
    where: "id = ?",
    whereArgs: [sql.id],
  );
}

Future<void> deleteHabit(int id) async {
  final db = await database;
  await db.delete(
    'habits',
    where: "id = ?",
    whereArgs: [id],
  );
}
