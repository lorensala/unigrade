import 'package:flutter/material.dart';

import 'grade.dart';

enum SubjectState {
  aprobacionDirecta,
  promocionPractica,
  promocionTeorica,
  regular,
}

// Unnecesary assignment of state 'Libre'.

class Subject {
  String id;
  String name;
  int year;
  List<Grade> gradesP;
  List<Grade> gradesT;
  List<Grade> gradesTP;
  List<Grade> aplazos;
  SubjectState state;
  Grade? finalGrade;
  String icon;
  String duration;
  bool elect;
  int? points;
  bool visible;

  Subject({
    required this.id,
    required this.name,
    required this.year,
    required this.gradesP,
    required this.gradesT,
    required this.gradesTP,
    required this.state,
    required this.icon,
    required this.aplazos,
    required this.duration,
    required this.elect,
    required this.visible,
    this.finalGrade,
    this.points,
  });

  /*TODO: No deberia exisitir el passed, hay que calcular de una si la nota
  es mayor a 6, entonces ahi esta aprobada. Las condiciones deberian ser
  regular, porom, ap directa.
  */

  void addgradeP(Grade grade) => gradesP.add(grade);
  void addgradeT(Grade grade) => gradesT.add(grade);
  void addgradeTP(Grade grade) => gradesTP.add(grade);
  void addgradeAp(Grade grade) => aplazos.add(grade);

  void deleteGradeP(Grade grade) => gradesP.remove(grade);
  void deleteGradeT(Grade grade) => gradesT.remove(grade);
  void deleteGradeTP(Grade grade) => gradesTP.remove(grade);
  void deleteGradeAp(Grade grade) => aplazos.remove(grade);

  void modGradeP(Grade grade, Grade newGrade) {
    final int index = gradesP.indexOf(grade);
    gradesP[index] = newGrade;
  }

  void modGradeT(Grade grade, Grade newGrade) {
    final int index = gradesT.indexOf(grade);
    gradesT[index] = newGrade;
  }

  void modGradeTP(Grade grade, Grade newGrade) {
    final int index = gradesTP.indexOf(grade);
    gradesTP[index] = newGrade;
  }

  void modGradAp(Grade grade, Grade newGrade) {
    if (grade.passed && newGrade.passed) {
      finalGrade = newGrade;
    } else if (grade.passed && !newGrade.passed) {
      finalGrade = newGrade;
      aplazos.add(newGrade);
    } else if (!grade.passed && newGrade.passed) {
      aplazos.remove(grade);
      finalGrade = newGrade;
    } else {
      final int index = aplazos.indexOf(grade);
      aplazos[index] = newGrade;
    }
  }
}
