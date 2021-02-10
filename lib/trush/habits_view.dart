import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// View
import 'single_habit.dart';
import 'create_habit_view.dart';
// State
import '../model/provider/habit_provider.dart';
import '../model/habit_defs.dart';

class HabitsView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final habitCount = useProvider(habitCountProvider);
    return (habitCount > 0
        ? CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('title'),
                ),
                expandedHeight: 50,
                actions: [
                  IconButton(
                    icon: Icon(Icons.add_outlined),
                    onPressed: () async {
                      final Habit ret = await Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => CreateHabitView(),
                      ));
                      if (ret != null) {
                        final prov = context.read(habitListStateProvider);
                        if (prov != null) {
                          prov.addNewHabit(ret.title, ret.emoji);
                        }
                      }
                    },
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return SingleHabit(index: index);
                  },
                  childCount: habitCount,
                ),
              ),
            ],
          )
        : Center(
            child: Container(
              alignment: Alignment.center,
              height: 200,
              width: 200,
              child: Column(
                children: <Widget>[
                  Text('No Habits', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final Habit ret = await Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) => CreateHabitView(),
                      ));
                      if (ret != null) {
                        final prov = context.read(habitListStateProvider);
                        if (prov != null) {
                          prov.addNewHabit(ret.title, ret.emoji);
                        }
                      }
                    },
                    child: Text('New'),
                  ),
                ],
              ),
            ),
          ));
  }
}
