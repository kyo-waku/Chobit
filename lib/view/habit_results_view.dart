import 'package:flutter/material.dart';
import './habit_item_graph.dart';
import './meter_graph.dart';

class HabitResultsView extends StatelessWidget {
  // test data
  final List<int> dates = [6, 7, 8, 9, 10, 11, 12];
  final List<int> scores = [0, 3, 0, 2, 0, 3, 1];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              child: Text('なんかよさげタイトルエリア',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            MeterGraph(
              height: 200,
              width: 200,
              baseColor: Colors.lime,
              signalColor: Colors.amber,
            ),
            SingleItemBarGraph(
                accentColor: Colors.cyan,
                title: '筋トレ',
                score: 8,
                dates: dates,
                scores: scores),
            SingleItemBarGraph(
                accentColor: Colors.lightGreen,
                title: '水飲む',
                score: 12,
                dates: dates,
                scores: scores),
            SingleItemBarGraph(
                accentColor: Colors.lightBlue,
                title: '本を読む',
                score: 5,
                dates: dates,
                scores: scores),
            SingleItemBarGraph(
                accentColor: Colors.amber,
                title: '叫ぶ',
                score: 14,
                dates: dates,
                scores: scores),
            SingleItemBarGraph(
                accentColor: Colors.purple,
                title: '踊る',
                score: 3,
                dates: dates,
                scores: scores),
          ],
        ),
      ),
    );
  }
}
