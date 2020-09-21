import 'package:flutter/material.dart';

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

class MyInheritedState extends State<MyInherited> {
  @override
  Widget build(BuildContext context) {
    return _Inherited(
      state: this,
      child: widget.child,
    );
  }

  String get today {
    var date = new DateTime.now();
    return '${date.year} / ${date.month} / ${date.day}';
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
