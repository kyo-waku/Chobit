import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../habit_defs.dart';

final habitListStateProvider = StateNotifierProvider((_) {
  return HabitList([]);
});

final indexedHabitProvider = (int index) => Provider((ref) {
      final habits = ref.watch(habitListStateProvider.state);
      if (habits.length > index) {
        return habits[index];
      } else {
        return null;
      }
    });

final habitCountProvider = Provider((ref) {
  final habits = ref.watch(habitListStateProvider.state);
  return habits.length;
});