abstract class Failure {
  final String message;

  Failure({required this.message});
}

class NoFailure extends Failure {
  NoFailure() : super(message: '');
}

class WeakPasswordFailure extends Failure {
  WeakPasswordFailure() : super(message: 'Weak password.');
}

class EmailAlreadyInUseFailure extends Failure {
  EmailAlreadyInUseFailure() : super(message: 'Email already in use.');
}

class InvalidEmailFailure extends Failure {
  InvalidEmailFailure() : super(message: 'Invalid email.');
}

class InvalidPasswordFailure extends Failure {
  InvalidPasswordFailure() : super(message: 'Invalid Password.');
}

class UnknownFailure extends Failure {
  UnknownFailure() : super(message: '');
}

class WrongPasswordOrEmailFalure extends Failure {
  WrongPasswordOrEmailFalure() : super(message: 'Wrong password or email.');
}

class UserNotFoundFailure extends Failure {
  UserNotFoundFailure() : super(message: 'User not found.');
}

class InvalidCredentialFailure extends Failure {
  InvalidCredentialFailure() : super(message: 'Invalid Credential failure.');
}

class SignOutFailure extends Failure {
  SignOutFailure() : super(message: 'Error while signing out.');
}

class UserDisabledFailure extends Failure {
  UserDisabledFailure() : super(message: 'User disabled.');
}

class TooManyRequestsFailure extends Failure {
  TooManyRequestsFailure() : super(message: 'Too many request.');
}
