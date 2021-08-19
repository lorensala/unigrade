class Professorship {
  final String professorship;

  factory Professorship(String professorship) {
    return Professorship._(professorship);
  }

  Professorship._(this.professorship);
}

String validateProfessorship(String professorship) {
  const String professorshipRegEx = r'''^\dk\d$''';
  if (RegExp(professorshipRegEx).hasMatch(professorship.toString())) {
    return professorship;
  } else {
    throw InvalidGradeException(failedValue: professorship.toString());
  }
}

class InvalidGradeException implements Exception {
  final String failedValue;

  InvalidGradeException({required this.failedValue});
}
