import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/nothing.dart';
import 'package:unigrade/domain/value/password_value.dart';

abstract class ISignInService {
  Future<Either<Failure, UserCredential>> signIn(
      [EmailAddress? email, Password? password]);

  Future<Either<Failure, Nothing>> signOut();
}
