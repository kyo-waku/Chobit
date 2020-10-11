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
      makeInitHabit();
    }
    return habitData;
  }

  void callAsyncInsert(Habit habit) async {
    await insertHabit(habit);
  }

  Future<void> makeInitHabit() async {
    getHabits().then((List<Habit> hbs) {
      setState(() => habitData.addAll(hbs));
    });
  }

  // テスト用初期値
  void addNewHabit(Habit newHabit) => {
        callAsyncInsert(newHabit),
        setState(
          () => habitData.add(newHabit),
        ),
      };

  void newRecord(String habitUuid, Score score) => {
        setState(() => {
              // TODO: データベース処理追加する
              (habitData.firstWhere((x) => (x.uuid == habitUuid)).histories.where((x) => isSameDate(x.dateTime, DateTime.now())))
                      .isEmpty // 同じuuid かつ 同じ日に登録があるか?
                  ? habitData.firstWhere((x) => (x.uuid == habitUuid)).histories.add(new History(DateTime.now(), score))
                  : habitData.firstWhere((x) => (x.uuid == habitUuid)).histories.firstWhere((x) => isSameDate(x.dateTime, DateTime.now())).score = score
            })
      };
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
