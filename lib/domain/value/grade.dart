class Grade {
  final int grade;

  factory Grade(int grade) {
    return Grade._(validateGrade(grade));
  }

  Grade._(this.grade);

  bool get passed => grade >= 6;
}

int validateGrade(int grade) {
  const String gradeRegEx = '[1-9]|10';
  if (RegExp(gradeRegEx).hasMatch(grade.toString())) {
    return grade;
  } else {
    throw InvalidGradeException(failedValue: grade.toString());
  }
}

class InvalidGradeException implements Exception {
  final String failedValue;

  InvalidGradeException({required this.failedValue});
}
