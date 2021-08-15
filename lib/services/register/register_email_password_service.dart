import 'package:dartz/dartz.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/password_value.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unigrade/services/register/i_register_service.dart';

class RegisterEmailPasswordService implements IRegisterService {
  @override
  Future<Either<Failure, UserCredential>> register(
      [EmailAddress? email, Password? password]) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email!.value, password: password!.value);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(WeakPasswordFailure());
      } else if (e.code == 'email-already-in-use') {
        return left(EmailAlreadyInUseFailure());
      }
      return left(UnknownFailure());
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
