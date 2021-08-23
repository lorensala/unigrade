import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/subject_controller.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/grade.dart';

class MisNotasEditPageController extends GetxController {
  late final TextEditingController textControllerGradeT1;
  late final TextEditingController textControllerGradeT2;
  late final TextEditingController textControllerGradeT3;
  late final TextEditingController textControllerGradeT4;

  late final TextEditingController textControllerGradeP1;
  late final TextEditingController textControllerGradeP2;
  late final TextEditingController textControllerGradeP3;
  late final TextEditingController textControllerGradeP4;

  late final TextEditingController textControllerGradeTP1;
  late final TextEditingController textControllerGradeTP2;
  late final TextEditingController textControllerGradeTP3;
  late final TextEditingController textControllerGradeTP4;

  late final TextEditingController textControllerGradeF1;
  late final TextEditingController textControllerGradeF2;
  late final TextEditingController textControllerGradeF3;
  late final TextEditingController textControllerGradeF4;

  late final TextEditingController textControllerFinalGrade;

  @override
  void onInit() {
    textControllerGradeT1 = TextEditingController();
    textControllerGradeT2 = TextEditingController();
    textControllerGradeT3 = TextEditingController();
    textControllerGradeT4 = TextEditingController();

    textControllerGradeP1 = TextEditingController();
    textControllerGradeP2 = TextEditingController();
    textControllerGradeP3 = TextEditingController();
    textControllerGradeP4 = TextEditingController();

    textControllerGradeTP1 = TextEditingController();
    textControllerGradeTP2 = TextEditingController();
    textControllerGradeTP3 = TextEditingController();
    textControllerGradeTP4 = TextEditingController();

    textControllerGradeF1 = TextEditingController();
    textControllerGradeF2 = TextEditingController();
    textControllerGradeF3 = TextEditingController();
    textControllerGradeF4 = TextEditingController();

    textControllerFinalGrade = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    textControllerGradeT1.dispose();
    textControllerGradeT2.dispose();
    textControllerGradeT3.dispose();
    textControllerGradeT4.dispose();

    textControllerGradeP1.dispose();
    textControllerGradeP2.dispose();
    textControllerGradeP3.dispose();
    textControllerGradeP4.dispose();

    textControllerGradeTP1.dispose();
    textControllerGradeTP2.dispose();
    textControllerGradeTP3.dispose();
    textControllerGradeTP4.dispose();

    textControllerGradeF1.dispose();
    textControllerGradeF2.dispose();
    textControllerGradeF3.dispose();
    textControllerGradeF4.dispose();

    textControllerFinalGrade.dispose();

    super.onClose();
  }

  Subject setGrades() {
    final SubjectController subjectController = Get.find<SubjectController>();

    final List<Grade> gradesT = <Grade>[
      if (textControllerGradeT1.text != '')
        Grade(int.parse(textControllerGradeT1.text)),
      if (textControllerGradeT2.text != '')
        Grade(int.parse(textControllerGradeT2.text)),
      if (textControllerGradeT3.text != '')
        Grade(int.parse(textControllerGradeT3.text)),
      if (textControllerGradeT4.text != '')
        Grade(int.parse(textControllerGradeT4.text)),
    ];

    final List<Grade> gradesP = <Grade>[
      if (textControllerGradeP1.text != '')
        Grade(int.parse(textControllerGradeP1.text)),
      if (textControllerGradeP2.text != '')
        Grade(int.parse(textControllerGradeP2.text)),
      if (textControllerGradeP3.text != '')
        Grade(int.parse(textControllerGradeP3.text)),
      if (textControllerGradeP4.text != '')
        Grade(int.parse(textControllerGradeP4.text)),
    ];

    final List<Grade> gradesTP = <Grade>[
      if (textControllerGradeTP1.text != '')
        Grade(int.parse(textControllerGradeTP1.text)),
      if (textControllerGradeTP2.text != '')
        Grade(int.parse(textControllerGradeTP2.text)),
      if (textControllerGradeTP3.text != '')
        Grade(int.parse(textControllerGradeTP3.text)),
      if (textControllerGradeTP4.text != '')
        Grade(int.parse(textControllerGradeTP4.text)),
    ];

    final List<Grade> failings = <Grade>[
      if (textControllerGradeF1.text != '')
        Grade(int.parse(textControllerGradeF1.text)),
      if (textControllerGradeF2.text != '')
        Grade(int.parse(textControllerGradeF2.text)),
      if (textControllerGradeF3.text != '')
        Grade(int.parse(textControllerGradeF3.text)),
      if (textControllerGradeF4.text != '')
        Grade(int.parse(textControllerGradeF4.text)),
    ];

    if (textControllerFinalGrade.text != '') {
      final Grade finalGrade = Grade(int.parse(textControllerFinalGrade.text));
      return subjectController.subject.copyWith(
          gradesP: gradesP,
          gradesT: gradesT,
          gradesTP: gradesTP,
          failings: failings,
          finalGrade: finalGrade);
    } else {
      return subjectController.subject.copyWith(
        gradesP: gradesP,
        gradesT: gradesT,
        gradesTP: gradesTP,
        failings: failings,
      );
    }
  }

  void getGrades() {
    final SubjectController subjectController = Get.find<SubjectController>();

    final int countT = subjectController.subject.gradesT.length;
    final int countP = subjectController.subject.gradesP.length;
    final int countTP = subjectController.subject.gradesTP.length;
    final int countF = subjectController.subject.failings.length;

    for (int i = 0; i < countT; i++) {
      if (i == 0) {
        textControllerGradeT1.text =
            subjectController.subject.gradesT[0].grade.toString();
      } else if (i == 1) {
        textControllerGradeT2.text =
            subjectController.subject.gradesT[1].grade.toString();
      } else if (i == 2) {
        textControllerGradeT3.text =
            subjectController.subject.gradesT[2].grade.toString();
      } else if (i == 3) {
        textControllerGradeT4.text =
            subjectController.subject.gradesT[3].grade.toString();
      }
    }

    for (int i = 0; i < countP; i++) {
      if (i == 0) {
        textControllerGradeP1.text =
            subjectController.subject.gradesP[0].grade.toString();
      } else if (i == 1) {
        textControllerGradeP2.text =
            subjectController.subject.gradesP[1].grade.toString();
      } else if (i == 2) {
        textControllerGradeP3.text =
            subjectController.subject.gradesP[2].grade.toString();
      } else if (i == 3) {
        textControllerGradeP4.text =
            subjectController.subject.gradesP[3].grade.toString();
      }
    }

    for (int i = 0; i < countTP; i++) {
      if (i == 0) {
        textControllerGradeTP1.text =
            subjectController.subject.gradesTP[0].grade.toString();
      } else if (i == 1) {
        textControllerGradeTP2.text =
            subjectController.subject.gradesTP[1].grade.toString();
      } else if (i == 2) {
        textControllerGradeTP3.text =
            subjectController.subject.gradesTP[2].grade.toString();
      } else if (i == 3) {
        textControllerGradeTP4.text =
            subjectController.subject.gradesTP[3].grade.toString();
      }
    }
    for (int i = 0; i < countF; i++) {
      if (i == 0) {
        textControllerGradeF1.text =
            subjectController.subject.failings[0].grade.toString();
      } else if (i == 1) {
        textControllerGradeF2.text =
            subjectController.subject.failings[1].grade.toString();
      } else if (i == 2) {
        textControllerGradeF3.text =
            subjectController.subject.failings[2].grade.toString();
      } else if (i == 3) {
        textControllerGradeF4.text =
            subjectController.subject.failings[3].grade.toString();
      }
    }

    if (subjectController.subject.finalGrade != null) {
      textControllerFinalGrade.text =
          subjectController.subject.finalGrade!.grade.toString();
    }
  }
}
