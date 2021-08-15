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
              error: loginPageController.invalidEmailRegister,
              controller: loginPageController.textControllerEmailRegister,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress),
        ),
        Obx(
          () => CustomTextField(
              error: loginPageController.passwordsDontMatch,
              controller: loginPageController.textControllerPasswordRegister,
              password: true,
              hintText: 'Contraseña',
              textInputType: TextInputType.visiblePassword),
        ),
        Obx(
          () => CustomTextField(
              error: loginPageController.passwordsDontMatch,
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

    // Validate passwords are identical.

    try {
      final EmailAddress emailAddress = EmailAddress(
          loginPageController.textControllerEmailRegister.text.trim());

      loginPageController.invalidEmailLogin = false;

      final Password password = Password(
          loginPageController.textControllerPasswordRegister.text.trim());

      final Password passwordCopy = Password(
          loginPageController.textControllerPasswordCopyRegister.text.trim());

      if (password.value != passwordCopy.value) {
        throw PasswordsDontMatchException();
      }
      loginPageController.passwordsDontMatch = true;
      signInController.register(
          RegisterEmailPasswordService(), emailAddress, password);
    } on InvalidEmailException {
      // do something here
      print('invalid email');
      loginPageController.invalidEmailRegister = true;
    } on PasswordsDontMatchException {
      print('passwords dont match.');
      loginPageController.passwordsDontMatch = true;
    }
  }
}
