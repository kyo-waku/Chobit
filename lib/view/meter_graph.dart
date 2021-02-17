import 'dart:math' as math;
import 'package:flutter/material.dart';

/**
  Painters
*/
class ArcPainter extends CustomPainter {
  ArcPainter(
      {this.startAngle = 0, this.sweepAngle = 0, this.color = Colors.white});
  final double startAngle;
  final double sweepAngle;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(size.width * 0.05, size.width * 0.05,
        size.width * 0.95, size.height * 0.95);
    final startAngle = math.pi / 12 * this.startAngle;
    final sweepAngle = math.pi / 12 * this.sweepAngle;
    final useCenter = false;
    final paint = Paint()
      ..color = this.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, size.width * 0.5);
    path.lineTo(size.width * 0.5 + size.width / 30, size.height * 0.5);
    path.lineTo(size.width * 0.5 + 1, size.height - size.width / 30);
    path.lineTo(size.width * 0.5 - 1, size.height - size.width / 30);
    path.lineTo(size.width * 0.5 - size.width / 30, size.height * 0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ArrowClipper oldClipper) => false;
}

/**
  Meter Graph Component
*/
class MeterGraph extends StatelessWidget {
  final double height;
  final double width;
  const MeterGraph({this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: Colors.cyan,
            shape: BoxShape.circle,
          ),
        ),
        CustomPaint(
          size: Size(height, width),
          painter: ArcPainter(
            startAngle: 10,
            sweepAngle: 16,
            color: Colors.lime,
          ),
        ),
        CustomPaint(
          size: Size(height, width),
          painter: ArcPainter(
            startAngle: 10,
            sweepAngle: 10,
            color: Colors.amber,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Container(
            width: width * 0.1,
            height: height * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: math.pi / 12 * 14,
            child: ClipPath(
              clipper: ArrowClipper(),
              child: Container(
                width: width * 0.9,
                height: height * 0.9,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Container(
          height: height * 0.9,
          width: width,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '60%',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '18/30',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 4),
                  Text('points'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
