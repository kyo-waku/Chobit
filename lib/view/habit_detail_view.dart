import 'package:flutter/material.dart';

class HabitDetailView extends StatelessWidget {
  Widget build(BuildContext context) {
    final backHome = () => {Navigator.of(context).pop()};
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 5) {
            // 横スワイプで戻る
            backHome();
          }
        },
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
