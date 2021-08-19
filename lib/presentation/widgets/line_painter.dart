import 'package:flutter/material.dart';

enum Direction { Horizontal, Vertical }

class LinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Direction direction;
  final double strokeWidth;
  final Color color;

  const LinePainter(
      {required this.strokeWidth,
      required this.dashWidth,
      required this.dashSpace,
      required this.color,
      required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    if (direction == Direction.Horizontal) {
      double startX = 0;
      const double startY = 0;
      while (startX < size.width) {
        canvas.drawLine(
            Offset(startX, startY), Offset(startX + dashWidth, startY), paint);
        startX += dashWidth + dashSpace;
      }
    } else {
      double startY = 0;
      const double startX = 0;
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
