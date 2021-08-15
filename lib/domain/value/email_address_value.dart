class EmailAddress {
  final String value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

String validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const String emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvalidEmailException(failedValue: input);
  }
}

class InvalidEmailException implements Exception {
  final String failedValue;

  InvalidEmailException({required this.failedValue});
}
