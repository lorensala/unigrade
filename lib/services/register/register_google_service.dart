import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/password_value.dart';
import 'package:unigrade/services/register/i_register_service.dart';

class GoogleRegisterService implements IRegisterService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  @override
  Future<Either<Failure, UserCredential>> register(
      EmailAddress email, Password password) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        return right(userCredential);
      }
      return left(UnknownFailure());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return left(InvalidCredentialFailure());
      } else if (e.code == 'user-not-found') {
        return left(UserNotFoundFailure());
      }
      return left(UnknownFailure());
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
