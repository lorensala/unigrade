import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/login_page_controller.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/password_value.dart';
import 'package:unigrade/presentation/widgets/custom_text_field.dart';
import 'package:unigrade/presentation/widgets/sign_in_button.dart';
import 'package:unigrade/services/sign_in/sign_in_email_password_service.dart';

class SignInEmail extends StatelessWidget {
  const SignInEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Obx(
          () => CustomTextField(
              error: loginPageController.invalidEmail,
              controller: loginPageController.textControllerEmailLogin,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress),
        ),
        Obx(
          () => CustomTextField(
              error: loginPageController.invalidPassword,
              controller: loginPageController.textControllerPasswordLogin,
              password: true,
              hintText: 'Contraseña',
              textInputType: TextInputType.visiblePassword),
        ),
        SingInButton(
          onPressed: () {
            signIn(loginPageController);
          },
          borderColor: Colors.black,
          labelColor: Colors.black,
          color: Colors.white,
          label: 'Iniciar sesión con Email',
          icon: const FaIcon(FontAwesomeIcons.inbox, color: Colors.black),
        ),
      ],
    );
  }

  void signIn(LoginPageController loginPageController) {
    final SignInController signInController = Get.find<SignInController>();

    loginPageController.isLoading = true;

    try {
      final EmailAddress emailAddress = EmailAddress(
          loginPageController.textControllerEmailLogin.text.trim());

      loginPageController.invalidEmail = false;

      final Password password =
          Password(loginPageController.textControllerPasswordLogin.text.trim());

      loginPageController.invalidPassword = false;

      signInController.signIn(
          SignInEmailPasswordService(), emailAddress, password);

      loginPageController.errorMessage = '';
    } on InvalidEmailException {
      loginPageController.invalidEmail = true;
      loginPageController.errorMessage = 'invalid email';
    } on InvalidPasswordException {
      loginPageController.invalidPassword = true;
      loginPageController.errorMessage = 'invalid password';
    } finally {
      loginPageController.isLoading = false;
    }
  }
}
