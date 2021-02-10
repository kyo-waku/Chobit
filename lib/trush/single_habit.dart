import 'package:chobit/model/provider/habit_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../model/habit_defs.dart';

class SingleHabit extends HookWidget {
  final int index;
  const SingleHabit({this.index});
  @override
  Widget build(BuildContext context) {
    final Habit habit = useProvider(indexedHabitProvider(index));
    return (Container(
      height: 120,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(habit.emoji,
                      style: TextStyle(fontSize: 40)), // Icon(Icons.directions_run_outlined, size: 60),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      habit.title,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.headline5.fontSize,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.grade_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.thumb_up_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.copyright_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.king_bed_outlined),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
