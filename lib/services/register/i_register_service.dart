import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/password_value.dart';

abstract class IRegisterService {
  Future<Either<Failure, UserCredential>> register(
      EmailAddress email, Password password);
}
