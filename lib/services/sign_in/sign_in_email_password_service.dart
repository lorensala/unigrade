import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/nothing.dart';
import 'package:unigrade/domain/value/password_value.dart';
import 'package:unigrade/services/sign_in/i_sing_in_service.dart';

class SignInEmailPasswordService implements ISignInService {
  @override
  Future<Either<Failure, UserCredential>> signIn(
      [EmailAddress? email, Password? password]) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!.value,
        password: password!.value,
      );
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(UserNotFoundFailure());
      } else if (e.code == 'wrong-password') {
        return left(WrongPasswordOrEmailFalure());
      } else if (e.code == 'invalid-email') {
        return left(WrongPasswordOrEmailFalure());
      } else if (e.code == 'user-disabled') {
        return left(UserDisabledFailure());
      } else if (e.code == 'too-many-requests') {
        return left(TooManyRequestsFailure());
      } else {
        return left(UnknownFailure());
      }
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Nothing>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return right(Nothing());
    } catch (e) {
      return left(SignOutFailure());
    }
  }
}
