import 'package:chobit/model/provider/habit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'view/habit_results_view.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var provHabits = context.read(habitListStateProvider);
    if (provHabits != null) {
      provHabits.initializeFromDb();
    }
    return MaterialApp(
      title: 'Chobit',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomeScaffold(),
    );
  }
}

// MyHomeScaffold
class MyHomeScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HabitResultsView(),
    );
  }
}
