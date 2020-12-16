import 'package:flutter/material.dart';
import 'define.dart';
import 'datastore.dart';

// Inherited
class MyInherited extends StatefulWidget {
  const MyInherited({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  MyInheritedState createState() => MyInheritedState();

  static MyInheritedState of(BuildContext context, {bool listen = true}) {
    return (listen
        ? context.dependOnInheritedWidgetOfExactType<_Inherited>().state
        : (context.getElementForInheritedWidgetOfExactType<_Inherited>().widget as _Inherited).state);
  }
}

// 状態の定義はここで管理
class MyInheritedState extends State<MyInherited> {
  @override
  Widget build(BuildContext context) {
    return _Inherited(
      state: this,
      child: widget.child,
    );
  }

  List<Habit> habitData = new List<Habit>();

  List<Habit> get habits {
    if (habitData.isEmpty) {
      initializeHabitFromDB();
    }
    return habitData;
  }

  // アプリ起動時のデータベース読み込み
  Future<void> initializeHabitFromDB() async {
    getHabits().then((List<Habit> hbs) {
      for (var habit in hbs) {
        if (habit.histories == null) {
          getHistory(habit.uuid).then((List<History> histories) {
            habit.histories = histories;
          });
        }
      }
      setState(() => habitData = hbs);
    });
  }

  Future<void> initializeHistoryFromDB(String parentuuid, Habit habit) async {
    getHistory(parentuuid).then((List<History> histories) {
      setState(() => habit.histories.addAll(histories));
    });
  }

  // 習慣の新規登録
  void addNewHabit(Habit newHabit) => {
        callAsyncInsertHabit(newHabit),
        setState(
          () => habitData.add(newHabit),
        ),
      };

  void callAsyncInsertHabit(Habit habit) async {
    await insertHabit(habit);
    await insertHistory(habit.uuid, habit.histories.first);
  }

  // 実施記録
  void newHistory(String habitUuid, Score score) => {
        setState(() => {
              if (habitData.firstWhere((x) => (x.uuid == habitUuid)).histories.where((x) => isSameDate(x.dateTime, DateTime.now())).isEmpty)
                {
                  habitData.firstWhere((x) => (x.uuid == habitUuid)).histories.add(new History(DateTime.now(), score)),
                  callAsyncInsertHistory(habitUuid, score),
                }
              else
                {
                  habitData.firstWhere((x) => (x.uuid == habitUuid)).histories.firstWhere((x) => isSameDate(x.dateTime, DateTime.now())).score = score,
                  callAsyncUpdateHistory(habitUuid, score),
                }
            })
      };

  void callAsyncInsertHistory(String habitUuid, Score score) async {
    History history = new History(DateTime.now(), score);
    await insertHistory(habitUuid, history);
  }

  void callAsyncUpdateHistory(String habitUuid, Score score) async {
    History history = new History(DateTime.now(), score);
    await updateHistory(habitUuid, history);
  }
}

class _Inherited extends InheritedWidget {
  const _Inherited({
    Key key,
    @required this.state,
    @required Widget child,
  }) : super(key: key, child: child);

  final MyInheritedState state;

  @override
  bool updateShouldNotify(_Inherited old) => true;
}
