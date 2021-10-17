import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/nothing.dart';
import 'package:unigrade/domain/value/password_value.dart';
import 'package:unigrade/services/sign_in/i_sing_in_service.dart';

class GoogleSignInService implements ISignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  @override
  Future<Either<Failure, UserCredential>> signIn(
      [EmailAddress? email, Password? password]) async {
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
      } else if (e.code == 'user-disabled') {
        return left(UserDisabledFailure());
      }
      return left(UnknownFailure());
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, Nothing>> signOut() async {
    try {
      await _googleSignIn.signOut();
      return right(Nothing());
    } catch (e) {
      return left(SignOutFailure());
    }
  }
}

class SignInCanceledException implements Exception {}
