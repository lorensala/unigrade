abstract class Failure {}

class WeakPasswordFailure extends Failure {
  final String message = 'Weak password.';
}

class EmailAlreadyInUseFailure extends Failure {
  final String message = 'Email already in use.';
}

class InvalidEmailFailure extends Failure {
  final String message = 'Invalid email.';
}

class UnknownFailure extends Failure {
  final String message = 'Invalid email.';
}

class WrongPasswordOrEmailFalure extends Failure {
  final String message = 'Wrong password or email.';
}

class UserNotFoundFailure extends Failure {
  final String message = 'User not found.';
}

class InvalidCredentialFailure extends Failure {
  final String message = 'User not found.';
}

class SignOutFailure extends Failure {
  final String message = 'Error while signing out.';
}
