import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/subject_controller.dart';

import 'package:unigrade/core/constants.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/grade.dart';
import 'package:unigrade/presentation/mis_notas/mis_notas_edit.dart';
import 'package:unigrade/presentation/widgets/line_painter.dart';

const String TEORICO = '  TEÓ:   ';
const String PRACTICO = 'PRÁC:   ';
const String TP = '     TP:   ';
const String APL = '   APL:   ';
const String NOTAFINAL = 'NOTA FINAL:';

class GradeCard extends StatelessWidget {
  final Subject subject;
  final bool tappeable;

  const GradeCard({required this.subject, required this.tappeable});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (tappeable) {
          final SubjectController subjectController =
              Get.put(SubjectController());
          subjectController.subject = subject;

          Get.to(() => const MisNotasEdit());
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        decoration: BoxDecoration(
          color: (subject.finalGrade != null)
              ? const Color(0xffE2FFE3)
              : _getColors(subject.state),
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Column(
          children: <Widget>[
            FittedBox(
              child: Text(
                subject.name,
                style: const TextStyle(
                  fontFamily: AVENIR,
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 131,
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _GradesGrid(subject: subject),
                  if (subject.finalGrade != null)
                    _FinalGrade(subject: subject)
                  else
                    _SubjectState(subject: subject)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _getColors(SubjectState? state) {
    switch (state) {
      case SubjectState.aprobada:
        return const Color(0xffE2FFE3);
      case SubjectState.promocionPractica:
        return const Color(0xffEAD6FF);
      case SubjectState.promocionTeorica:
        return const Color(0xffE4F0FF);
      case SubjectState.regular:
        return const Color(0xffFEFFD9);
      default:
        return const Color(0xffF7F7F7);
    }
  }
}

class _FinalGrade extends StatelessWidget {
  const _FinalGrade({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          NOTAFINAL,
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 13,
            color: Color(0xff000000),
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.left,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Text(
            subject.finalGrade!.grade.toString(),
            style: const TextStyle(
              fontFamily: 'Avenir LT Std',
              fontSize: 50,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}

class _SubjectState extends StatelessWidget {
  const _SubjectState({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            _getSubjectStateText(subject.state),
            style: const TextStyle(
              fontFamily: AVENIR,
              fontSize: 18,
              color: Color(0xff000000),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  String _getSubjectStateText(SubjectState? state) {
    if (state == null) return '';

    const Map<SubjectState, String> stateText = <SubjectState, String>{
      SubjectState.regular: 'REG.',
      SubjectState.aprobada: 'AP.',
      SubjectState.promocionTeorica: 'PROM.T',
      SubjectState.promocionPractica: 'PROM.P',
    };

    return stateText[state]!;
  }
}

class _GradesGrid extends StatelessWidget {
  const _GradesGrid({
    required this.subject,
  });

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _GradeRow(label: TEORICO, grades: _getGradesTextT()),
        const _LineBetweenGrades(),
        _GradeRow(label: PRACTICO, grades: _getGradesTextP()),
        const _LineBetweenGrades(),
        _GradeRow(label: TP, grades: _getGradesTextTP()),
        const _LineBetweenGrades(),
        _GradeRow(label: APL, grades: _getGradesTextAP()),
      ],
    );
  }

  String _getGradesTextTP() {
    String grades = '';

    subject.gradesTP.forEach((element) {
      if (element.grade < 10) {
        grades += '${element.grade}  ';
      } else {
        grades += '${element.grade} ';
      }
    });

    return grades;
  }

  String _getGradesTextP() {
    String grades = '';

    subject.gradesP.forEach((Grade grade) {
      if (grade.grade < 10) {
        grades += '${grade.grade}  ';
      } else {
        grades += '${grade.grade} ';
      }
    });

    return grades;
  }

  String _getGradesTextT() {
    String grades = '';

    subject.gradesT.forEach((Grade grade) {
      if (grade.grade < 10) {
        grades += '${grade.grade}  ';
      } else {
        grades += '${grade.grade} ';
      }
    });

    return grades;
  }

  String _getGradesTextAP() {
    String grades = '';

    subject.failings.forEach((Grade grade) {
      if (grade.grade < 10) {
        grades += '${grade.grade}  ';
      } else {
        grades += '${grade.grade} ';
      }
    });

    return grades;
  }
}

class _LineBetweenGrades extends StatelessWidget {
  const _LineBetweenGrades({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: 160,
      height: 1,
      child: const CustomPaint(
        painter: LinePainter(
            strokeWidth: 1,
            dashWidth: 10,
            dashSpace: 3,
            color: Color(0xFF000000),
            direction: Direction.Horizontal),
      ),
    );
  }
}

class _GradeRow extends StatelessWidget {
  const _GradeRow({required this.label, required this.grades});

  final String label;
  final String grades;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontFamily: AVENIR,
              fontSize: 18,
              color: Color(0xff000000),
              fontWeight: FontWeight.w800),
        ),
        Text(
          grades,
          style: const TextStyle(
            fontFamily: AVENIR,
            fontSize: 18,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
