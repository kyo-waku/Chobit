import 'package:flutter/material.dart';
import 'define.dart';

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

  List<Habit> habit = new List<Habit>();

  List<Habit> get habits {
    if (habit.isEmpty) {
      habit = makeInit();
    }
    return habit;
  }

  int get numOfHabit {
    if (habit.isEmpty) {
      habit = makeInit();
    }
    return habit.length;
  }

  void addNewHabit(Habit newHabit) => setState(() => habit.add(newHabit));

  void newRecord(String habitTitle, Score score) => {
        // 一旦タイトルで一致させているが、UUIDかなんかに変える予定
        setState(() => {
              (habit.firstWhere((x) => (x.title == habitTitle)).histories.where((x) => isSameDate(x.dateTime, DateTime.now()))).isEmpty
                  ? habit.firstWhere((x) => (x.title == habitTitle)).histories.add(new History(DateTime.now(), score))
                  : habit.firstWhere((x) => (x.title == habitTitle)).histories.firstWhere((x) => isSameDate(x.dateTime, DateTime.now())).score = score
            })
      };
}

// テスト用初期値
List<Habit> makeInit() {
  List<Habit> hb = new List<Habit>();
  hb.add(initialHabit);
  hb.add(initialHabit2);
  hb.add(initialHabit3);
  return hb;
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
