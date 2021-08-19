import 'package:flutter/material.dart';

import 'package:unigrade/presentation/widgets/line_painter.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Avenir LT Std',
              fontSize: 30,
              color: Color(0xff000000),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 5,
            width: 200,
            child: CustomPaint(
              painter: LinePainter(
                  strokeWidth: 5,
                  color: Color(0xFF4CACFF),
                  dashWidth: 3,
                  dashSpace: 0,
                  direction: Direction.Horizontal),
            ),
          ),
        ),
      ],
    );
  }
}
