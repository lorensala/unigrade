import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/presentation/widgets/line_painter.dart';

class QuickBar extends StatelessWidget {
  const QuickBar();

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find<StudentController>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.0),
        color: const Color(0xff4cacff),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Obx(
                () => _QuickBarElement(
                    label: 'Promedio c/ aplazos',
                    value: (studentController.avgFailing == 0.00)
                        ? '-'
                        : studentController.avgFailing.toStringAsFixed(2)),
              ),
              const SizedBox(
                height: 70,
                width: 1,
                child: CustomPaint(
                    painter: LinePainter(
                        color: Color(0xFFFFFFFF),
                        strokeWidth: 1,
                        dashWidth: 5,
                        dashSpace: 3,
                        direction: Direction.Vertical)),
              ),
              Obx(() => _QuickBarElement(
                  label: 'Promedio s/ aplazos',
                  value: (studentController.avgNoFailing == 0.00)
                      ? '-'
                      : studentController.avgNoFailing.toStringAsFixed(2))),
              const SizedBox(
                height: 70,
                width: 1,
                child: CustomPaint(
                    painter: LinePainter(
                        color: Color(0xFFFFFFFF),
                        strokeWidth: 1,
                        dashWidth: 5,
                        dashSpace: 3,
                        direction: Direction.Vertical)),
              ),
              Obx(() => _QuickBarElement(
                  label: 'Materias restantes',
                  value: studentController.left.toString())),
            ]),
      ),
    );
  }
}

class _QuickBarElement extends StatelessWidget {
  const _QuickBarElement({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          value,
          style: const TextStyle(
            fontFamily: AVENIR,
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          width: 58.0,
          child: Text(label,
              style: const TextStyle(
                fontFamily: AVENIR,
                fontSize: 12,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
