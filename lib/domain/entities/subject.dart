import 'package:flutter/foundation.dart';

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
  cuatrimestral,
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

  factory Subject.fromMap(Map<String, dynamic> s) => Subject(
      id: int.parse(s['id'].toString()),
      name: s['name'].toString(),
      professorship: Professorship('1k1'),
      year: int.parse(s['year'].toString()),
      state: getState(s['state']?.toString()),
      gradesP: getGrade(List<int>.from(s['gradesP'] as List<dynamic>)),
      gradesT: getGrade(List<int>.from(s['gradesT'] as List<dynamic>)),
      gradesTP: getGrade(List<int>.from(s['gradesTP'] as List<dynamic>)),
      failings: getGrade(List<int>.from(s['failings'] as List<dynamic>)),
      duration: getDuration(s['duration'].toString()),
      type: getType(s['type'].toString()),
      icon: s['icon'].toString(),
      finalGrade: s['finalGrade'] != null
          ? Grade(int.parse(s['finalGrade'].toString()))
          : null);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'professorship': professorship.professorship,
      'year': year,
      'state': state != null ? _getStateName(state!) : null,
      'gradesP': gradesP.map((Grade grade) => grade.grade).toList(),
      'gradesT': gradesT.map((Grade grade) => grade.grade).toList(),
      'gradesTP': gradesTP.map((Grade grade) => grade.grade).toList(),
      'failings': failings.map((Grade grade) => grade.grade).toList(),
      'duration': _getDurationName(duration),
      'type': _getTypeName(type),
      'icon': icon,
      'finalGrade': finalGrade != null ? finalGrade!.grade : null,
    };
  }

  String _getStateName(SubjectState state) {
    switch (state) {
      case SubjectState.aprobada:
        return 'aprobada';
      case SubjectState.regular:
        return 'regular';
      case SubjectState.promocionPractica:
        return 'promocionPractica';
      case SubjectState.promocionTeorica:
        return 'promocionTeorica';
    }
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        professorship.hashCode ^
        year.hashCode ^
        gradesP.hashCode ^
        gradesT.hashCode ^
        gradesTP.hashCode ^
        failings.hashCode ^
        finalGrade.hashCode ^
        icon.hashCode ^
        points.hashCode;
  }
}

String _getDurationName(SubjectDuration duration) {
  switch (duration) {
    case SubjectDuration.anual:
      return 'anual';
    case SubjectDuration.cuatrimestral:
      return 'cuatrimestral';
    default:
      return 'anual';
  }
}

String _getTypeName(SubjectType type) {
  switch (type) {
    case SubjectType.csbasica:
      return 'csbasica';
    case SubjectType.especializada:
      return 'especializada';
    case SubjectType.electiva:
      return 'electiva';
    default:
      return 'csbasica';
  }
}

List<Grade> getGrade(List<int> grades) =>
    grades.map((int i) => Grade(i)).toList();

SubjectState? getState(String? state) {
  switch (state) {
    default:
      return null;
  }
}

SubjectDuration getDuration(String duration) {
  switch (duration) {
    case 'anual':
      return SubjectDuration.anual;
    case 'cuatrimestral':
      return SubjectDuration.cuatrimestral;
    default:
      return SubjectDuration.anual;
  }
}

SubjectType getType(String type) {
  switch (type) {
    case 'csbasica':
      return SubjectType.csbasica;
    case 'especializada':
      return SubjectType.especializada;
    case 'electiva':
      return SubjectType.electiva;
    default:
      return SubjectType.especializada;
  }
}
