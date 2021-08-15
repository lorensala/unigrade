import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/login_page_controller.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/domain/value/email_address_value.dart';
import 'package:unigrade/domain/value/password_value.dart';
import 'package:unigrade/presentation/widgets/sign_in_button.dart';
import 'package:unigrade/services/register/register_google_service.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();
    final SignInController signInController = Get.find<SignInController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // GoogleSignIn
        SingInButton(
          onPressed: () async {
            await signInController.register(GoogleRegisterService(),
                EmailAddress('google@gmail.com'), Password('aJDHABSD1'));
          },
          borderColor: Colors.transparent,
          labelColor: Colors.white,
          color: const Color(0xffed5a4f),
          label: 'Registrate con Google',
          icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
        ),
        // AppleSignIn
        SingInButton(
          onPressed: () async {},
          borderColor: Colors.transparent,
          labelColor: Colors.white,
          color: Colors.black,
          label: 'Registrate con AppleID',
          icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.white),
        ),
        // SignInEmailAndPassword
        SingInButton(
          onPressed: () {
            loginPageController.navigateToRegisterEmail();
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
}
