import 'dart:math';
import 'package:flutter/material.dart';

class LightGradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: [
            Colors.white.withOpacity(0.7),
            Colors.red.withOpacity(0.7),
            Colors.orange.withOpacity(0.7),
          ],
        ),
      ),
    ));
  }
}

class GlassContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const GlassContainer({this.height, this.width, this.child});
  @override
  Widget build(BuildContext context) {
    return (Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.topLeft,
          child: child,
        ),
      ),
    ));
  }
}

class CircularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height);
    final arcAngle = 2 * pi * 0.5;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, paint);

    final paint2 = Paint()
      ..color = Colors.blue.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;
    final radius2 = min(size.width, size.height);
    final arcAngle2 = 2 * pi * 0.25;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius2), -pi / 2 + arcAngle, arcAngle2, false, paint2);

    final paint3 = Paint()
      ..color = Colors.red.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;
    final radius3 = min(size.width, size.height);
    final arcAngle3 = 2 * pi * 0.25;
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius3), -pi / 2 + arcAngle + arcAngle2, arcAngle3, false, paint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircularGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (CustomPaint(
      size: Size(50, 50),
      painter: CircularPainter(),
    ));
  }
}

class AppBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        )
      ],
    ));
  }
}

class TitleArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 48),
        child: Text(
          'SUMMARY',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}

class WeeklyBarGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}

class HabitContentsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Container(
          height: 50,
          width: 300,
          child: Text(
            '筋トレ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ));
  }
}

class BarGraphs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 420,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: GlassContainer(height: 100, width: 300, child: HabitContentsDemo()),
            ),
          ],
        ),
      ),
    ));
  }
}

class AppContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (SafeArea(
      child: Center(
        child: Column(
          children: [
            AppBarMenu(),
            TitleArea(),
            Padding(
              padding: EdgeInsets.all(100),
              child: CircularGraph(),
            ),
            BarGraphs(),
          ],
        ),
      ),
    ));
  }
}

class HabitResultsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Stack(
      children: [
        LightGradientBackground(),
        AppContents(),
      ],
    ));
  }
}
