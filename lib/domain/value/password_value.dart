class Password {
  final String value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

String validatePassword(String input) {
  // Minimum eight characters, at least one letter and one number:
  const String emailRegex = r'''^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$''';
  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvalidPasswordException(failedValue: input);
  }
}

class PasswordsDontMatchException implements Exception {}

class InvalidPasswordException implements Exception {
  final String failedValue;
  InvalidPasswordException({
    required this.failedValue,
  });
}
