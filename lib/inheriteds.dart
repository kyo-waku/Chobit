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

  Properties propData;

  Properties get props {
    if (propData == null) {
      propData = makeInitProp();
    }
    return propData;
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
  // TODO: あとでkey-valueからの取り出しに変える
  Properties makeInitProp() {
    return (new Properties(0));
  }

  void addNewHabit(Habit newHabit) => {callAsyncInsert(newHabit), setState(() => habitData.add(newHabit))};

  void newRecord(int habitId, Score score) => {
        setState(() => {
              (habitData.firstWhere((x) => (x.id == habitId)).histories.where((x) => isSameDate(x.dateTime, DateTime.now()))).isEmpty
                  ? habitData.firstWhere((x) => (x.id == habitId)).histories.add(new History(DateTime.now(), score))
                  : habitData.firstWhere((x) => (x.id == habitId)).histories.firstWhere((x) => isSameDate(x.dateTime, DateTime.now())).score = score
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
