import 'package:flutter/material.dart';
import './single_habit.dart';
import './create_habit_view.dart';

class HabitsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text('title'),
          ),
          expandedHeight: 50,
          actions: [
            IconButton(
              icon: Icon(Icons.add_outlined),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => CreateHabitView(),
                ));
              },
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return SingleHabit();
            },
            childCount: 5,
          ),
        ),
      ],
    ));
  }
}
