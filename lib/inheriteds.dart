import 'package:flutter/material.dart';
import 'Defines.dart';

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
        : (context.getElementForInheritedWidgetOfExactType<_Inherited>().widget
                as _Inherited)
            .state);
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

  List<Habit> habit = makeInit();
  int numOfHabit = 10; // テスト用にとりあえず10個にしている
}

List<Habit> makeInit() {
  List<Habit> hb = new List<Habit>();
  hb.add(initialHabit);
  hb.add(initialHabit2);
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
