import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/login_page_controller.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/nothing.dart';
import 'package:unigrade/domain/value/password_value.dart';
import 'package:unigrade/helpers/routes.dart';
import 'package:unigrade/services/register/i_register_service.dart';
import 'package:unigrade/services/sign_in/i_sing_in_service.dart';

class SignInController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        print('Signed out');
        if (Get.currentRoute != Routes.LOGIN) Get.offAllNamed(Routes.LOGIN);
      }
    });

    super.onInit();
  }

  Future<void> signIn(ISignInService service,
      [EmailAddress? email, Password? password]) async {
    if (email != null && password != null) {
      final Either<Failure, UserCredential?> response =
          await service.signIn(email, password);

      response.fold(
          (Failure failure) =>
              Get.snackbar('ERROR', failure.message), //TODO: Mostrar dialog.
          (UserCredential? userCredential) => Get.offAllNamed(
                Routes.HOME,
              ));
    } else {
      final Either<Failure, UserCredential?> response = await service.signIn();

      response.fold(
          (Failure failure) => null, //TODO: Mostrar dialog.
          (UserCredential? userCredential) => Get.offAllNamed(
                Routes.HOME,
              ));
    }
  }

  Future<void> signOut(ISignInService service) async {
    final Either<Failure, Nothing> response = await service.signOut();

    response.fold(
        (Failure failure) =>
            Get.snackbar('ERROR', failure.message), // TODO: Mostrar dialog,
        (Nothing nothing) => firebaseAuth.signOut());
  }

  Future<void> register(
      IRegisterService service, EmailAddress email, Password password) async {
    final Either<Failure, UserCredential?> userCredential =
        await service.register(email, password);

    userCredential.fold(
        (Failure failure) =>
            Get.snackbar('ERROR', failure.message), //TODO: show error dialog,
        (UserCredential? userCredential) {
      final LoginPageController loginPageController =
          Get.find<LoginPageController>();
      if (userCredential!.additionalUserInfo!.isNewUser) {
        loginPageController.navigateToAccountSetup();
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    });
  }
}
