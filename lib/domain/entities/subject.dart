import 'package:unigrade/domain/value/professorship.dart';

import '../value/grade.dart';

enum SubjectState {
  aprobada,
  regular,
  promocionPractica,
  promocionTeorica,
}

enum SubjectDuration {
  anual,
  semestral,
  intensivo,
}

enum SubjectType {
  csbasica,
  electiva,
  especializada,
  //troncal,
}

class Subject {
  int id;
  String name;
  Professorship professorship;
  int year;
  List<Grade> gradesP;
  List<Grade> gradesT;
  List<Grade> gradesTP;
  List<Grade> failings;
  SubjectState? state;
  Grade? finalGrade;
  String icon;
  SubjectDuration duration;
  SubjectType type;
  int? points;

  Subject({
    required this.id,
    required this.name,
    required this.professorship,
    required this.year,
    required this.gradesP,
    required this.gradesT,
    required this.gradesTP,
    required this.state,
    required this.icon,
    required this.failings,
    required this.duration,
    required this.type,
    this.finalGrade,
    this.points,
  });

  bool get passed {
    if (finalGrade != null) {
      return finalGrade!.grade >= 6;
    } else {
      return false;
    }
  }

  bool get electiva => type == SubjectType.electiva;

  void addgradeP(Grade grade) => gradesP.add(grade);
  void addgradeT(Grade grade) => gradesT.add(grade);
  void addgradeTP(Grade grade) => gradesTP.add(grade);
  void addgradeAp(Grade grade) => failings.add(grade);

  void deleteGradeP(Grade grade) => gradesP.remove(grade);
  void deleteGradeT(Grade grade) => gradesT.remove(grade);
  void deleteGradeTP(Grade grade) => gradesTP.remove(grade);
  void deleteGradeAp(Grade grade) => failings.remove(grade);

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
      failings.add(newGrade);
    } else if (!grade.passed && newGrade.passed) {
      failings.remove(grade);
      finalGrade = newGrade;
    } else {
      final int index = failings.indexOf(grade);
      failings[index] = newGrade;
    }
  }

  Subject copyWith({
    int? id,
    String? name,
    Professorship? professorship,
    int? year,
    List<Grade>? gradesP,
    List<Grade>? gradesT,
    List<Grade>? gradesTP,
    List<Grade>? failings,
    Grade? finalGrade,
    String? icon,
    int? points,
    SubjectDuration? duration,
    SubjectType? type,
    SubjectState? state,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
      professorship: professorship ?? this.professorship,
      year: year ?? this.year,
      gradesP: gradesP ?? this.gradesP,
      gradesT: gradesT ?? this.gradesT,
      gradesTP: gradesTP ?? this.gradesTP,
      failings: failings ?? this.failings,
      finalGrade: finalGrade,
      icon: icon ?? this.icon,
      points: points ?? this.points,
      type: type ?? this.type,
      duration: duration ?? this.duration,
      state: state ?? this.state,
    );
  }
}
