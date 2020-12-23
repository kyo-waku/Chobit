import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../habit_defs.dart';

const String habitDbName = 'habitDb.db';
const String habitTableName = 'habitTable';
const int latestDbVersion = 1;

Database _database;

Future<Database> getDatabase() async {
  if (_database != null) {
    return _database;
  }
  return _database = await initializeDb();
}

// Key: データベース用の統一キー (Auto Increment), 不変
Future<Database> initializeDb() {
  var db = getDatabasesPath().then((String path) {
    return openDatabase(
      join(path, habitDbName),
      onCreate: (db, version) {
        return db.execute(
          """
          CREATE TABLE $habitTableName(
            key INTEGER PRIMARY KEY AUTOINCREMENT,
            uuid TEXT,
            title TEXT,
            emoji TEXT,
            archived INTEGER
            )
          """,
        );
      },
      version: latestDbVersion,
    );
  });
  return db;
}

Future<void> addNewHabitToDb(Habit newHabit) async {
  final Database db = await getDatabase();

  await db.insert(
    habitTableName,
    HabitDefinedForDb(
      newHabit.uuid,
      newHabit.title,
      newHabit.emoji,
      newHabit.archived,
    ).toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// 作成済みのすべての項目を取得する
Future<List<Habit>> getHabitsFromDb() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.query(habitTableName);
  // print('GET:' + maps.toString());
  return List.generate(maps.length, (i) {
    return Habit(
      maps[i]['uuid'],
      maps[i]['title'],
      maps[i]['emoji'],
      (maps[i]['archived'] == 1) ? true : false,
    );
  });
}

// DEFINES

class HabitDefinedForDb {
  String uuid;
  String title;
  String emoji;
  int archived;

  HabitDefinedForDb(String uuid, String title, String emoji, bool archived) {
    this.uuid = uuid;
    this.title = title;
    this.emoji = emoji;
    this.archived = archived ? 1 : 0;
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'title': title,
      'emoji': emoji,
      'archived': archived,
    };
  }
}
