import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';
import './db/habit_db.dart';

class Habit {
  String uuid; // 習慣ごとのユニークなID
  String title; // 習慣のタイトル
  String emoji; // 絵文字
  bool archived; // アーカイブステータス (true: アーカイブ, false: 使用可能)

  Habit(this.uuid, this.title, this.emoji, this.archived);
}

class HabitList extends StateNotifier<List<Habit>> {
  HabitList([List<Habit> initialHabits]) : super(initialHabits ?? []);

  var _initialized = false;

  void initializeFromDb() async {
    var habits = await getHabitsFromDb();
    if (!_initialized) {
      state = [...habits];
    }
    _initialized = true;
  }

  void addNewHabit(String title, String emoji) async {
    var uuid = Uuid().v1();
    var newHabit = Habit(uuid, title, emoji, false);
    state = [...state, newHabit];
    await addNewHabitToDb(newHabit);
  }
}
