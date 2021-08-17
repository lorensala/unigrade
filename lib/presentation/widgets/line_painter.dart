import 'package:flutter/material.dart';

enum Direction { Horizontal, Vertical }

class LinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  double startY;
  double startX;
  final Direction direction;
  final double strokeWidth;
  final Color color;

  LinePainter(
      {required this.strokeWidth,
      required this.dashWidth,
      required this.dashSpace,
      required this.color,
      this.startX = 0,
      this.startY = 0,
      required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    if (direction == Direction.Horizontal) {
      while (startX < size.width) {
        canvas.drawLine(
            Offset(startX, startY), Offset(startX + dashWidth, startY), paint);
        startX += dashWidth + dashSpace;
      }
    } else {
      while (startY < size.height) {
        canvas.drawLine(
            Offset(startX, startY), Offset(startX, startY + dashWidth), paint);
        startY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
