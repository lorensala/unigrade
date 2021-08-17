import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/login_page_controller.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/password_value.dart';
import 'package:unigrade/presentation/widgets/custom_text_field.dart';
import 'package:unigrade/presentation/widgets/sign_in_button.dart';
import 'package:unigrade/services/register/register_email_password_service.dart';

class RegisterEmail extends StatelessWidget {
  const RegisterEmail({
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
              controller: loginPageController.textControllerEmailRegister,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress),
        ),
        Obx(
          () => CustomTextField(
              error: loginPageController.passwordsDontMatch ||
                  loginPageController.invalidPassword,
              controller: loginPageController.textControllerPasswordRegister,
              password: true,
              hintText: 'Contraseña',
              textInputType: TextInputType.visiblePassword),
        ),
        Obx(
          () => CustomTextField(
              error: loginPageController.passwordsDontMatch ||
                  loginPageController.invalidPassword,
              controller:
                  loginPageController.textControllerPasswordCopyRegister,
              password: true,
              hintText: 'Repite la contraseña',
              textInputType: TextInputType.visiblePassword),
        ),
        SingInButton(
          onPressed: () {
            register(loginPageController);
          },
          borderColor: Colors.black,
          labelColor: Colors.black,
          color: Colors.white,
          label: 'Registrate con Email',
          icon: const FaIcon(FontAwesomeIcons.envelope, color: Colors.black),
        ),
      ],
    );
  }

  void register(LoginPageController loginPageController) {
    final SignInController signInController = Get.find<SignInController>();

    loginPageController.isLoading = true;
    try {
      final EmailAddress emailAddress = EmailAddress(
          loginPageController.textControllerEmailRegister.text.trim());

      loginPageController.invalidEmail = false;

      final Password password = Password(
          loginPageController.textControllerPasswordRegister.text.trim());

      loginPageController.invalidPassword = false;

      final Password passwordCopy = Password(
          loginPageController.textControllerPasswordCopyRegister.text.trim());

      loginPageController.invalidPassword = false;

      if (password.value != passwordCopy.value) {
        throw PasswordsDontMatchException();
      }
      signInController.register(
          RegisterEmailPasswordService(), emailAddress, password);

      loginPageController.errorMessage = '';
    } on InvalidEmailException {
      loginPageController.invalidEmail = true;
      loginPageController.errorMessage = 'Invalid email.';
    } on PasswordsDontMatchException {
      loginPageController.errorMessage = 'Passwords dont match.';
      loginPageController.passwordsDontMatch = true;
    } on InvalidPasswordException {
      loginPageController.invalidPassword = true;
      loginPageController.errorMessage = 'Invalid password';
    } finally {
      loginPageController.isLoading = false;
    }
  }
}
