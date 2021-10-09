import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/login_page_controller.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/data/corr.dart';
import 'package:unigrade/presentation/login/account_setup_page.dart';
import 'package:unigrade/presentation/login/register_email_page.dart';
import 'package:unigrade/presentation/login/register_page.dart';
import 'package:unigrade/presentation/login/sign_in_email_page.dart';
import 'package:unigrade/presentation/login/sign_in_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: context.height,
              width: context.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const _BackButtonLogin(),
                  const _IconLogo(),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      loginPageController.errorMessage,
                      style: const TextStyle(
                          color: Colors.red, fontFamily: AVENIR),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Obx(
                    () => SingleChildScrollView(
                      child: AnimatedContainer(
                        color: Colors.red,
                        height: getContainerSize(),
                        duration: const Duration(milliseconds: 200),
                        child: PageTransitionSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (
                              Widget child,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                            ) {
                              return SharedAxisTransition(
                                fillColor: Colors.white,
                                animation: animation,
                                secondaryAnimation: secondaryAnimation,
                                transitionType:
                                    SharedAxisTransitionType.horizontal,
                                child: child,
                              );
                            },
                            child: showOptions()),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const _ClickeableText(),
                  const Spacer(flex: 2)

                  // Dont have an account? Sign up here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double getContainerSize() {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    switch (loginPageController.loginOption) {
      case LoginOption.SignIn:
        return 190;
      case LoginOption.Register:
        return 190;
      case LoginOption.LoginEmail:
        return 190;
      case LoginOption.RegisterEmail:
        return 250;
      case LoginOption.AccountSetup:
        return 350;
    }
  }

  Widget showOptions() {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    switch (loginPageController.loginOption) {
      case LoginOption.SignIn:
        loginPageController.showBackButton = true;
        return const SignInPage();
      case LoginOption.Register:
        loginPageController.showBackButton = true;
        return const RegisterPage();
      case LoginOption.LoginEmail:
        loginPageController.showBackButton = true;
        return const SignInEmail();
      case LoginOption.RegisterEmail:
        loginPageController.showBackButton = true;
        return const RegisterEmail();
      case LoginOption.AccountSetup:
        loginPageController.showBackButton = false;
        return const AccountSetupPage();
    }
  }
}

class _IconLogo extends StatelessWidget {
  const _IconLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 250,
            width: 250,
            child: SvgPicture.asset(LOGOASSET)),
        const Text(
          '¡Organiza tu carrera!',
          style: TextStyle(
              fontFamily: AVENIR, fontSize: 25, color: Color(0xFF7C7979)),
        ),
      ],
    );
  }
}

class _ClickeableText extends StatelessWidget {
  const _ClickeableText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          navigateOptions();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(getLabel(),
                style: const TextStyle(
                  fontFamily: AVENIR,
                  fontSize: 14,
                  color: Colors.black,
                )),
            Text(
              getClickeableLabel(),
              style: const TextStyle(
                fontFamily: AVENIR,
                fontSize: 14,
                color: Colors.lightBlue,
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateOptions() {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    switch (loginPageController.loginOption) {
      case LoginOption.SignIn:
        return loginPageController.navigateToRegister();
      case LoginOption.Register:
        return loginPageController.navigateToLogin();
      case LoginOption.LoginEmail:
        return loginPageController.navigateToRegister();
      case LoginOption.RegisterEmail:
        return loginPageController.navigateToLogin();
      case LoginOption.AccountSetup:
        return loginPageController.navigateToAccountSetup();
    }
  }

  String getLabel() {
    const String LABEL_LOGIN = 'Ya tienes cuenta? ';
    const String LABEL_REGISTER = 'No tienes cuenta? ';

    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    switch (loginPageController.loginOption) {
      case LoginOption.SignIn:
        return LABEL_REGISTER;
      case LoginOption.Register:
        return LABEL_LOGIN;
      case LoginOption.LoginEmail:
        return LABEL_REGISTER;
      case LoginOption.RegisterEmail:
        return LABEL_LOGIN;
      case LoginOption.AccountSetup:
        return '';
    }
  }

  String getClickeableLabel() {
    const String CLICKEABLE_LABEL_REGISTER = ' Registrate aquí';
    const String CLICKEABLE_LABEL_LOGIN = 'Inicia Sesión';

    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    switch (loginPageController.loginOption) {
      case LoginOption.SignIn:
        return CLICKEABLE_LABEL_REGISTER;
      case LoginOption.Register:
        return CLICKEABLE_LABEL_LOGIN;
      case LoginOption.LoginEmail:
        return CLICKEABLE_LABEL_REGISTER;
      case LoginOption.RegisterEmail:
        return CLICKEABLE_LABEL_LOGIN;
      case LoginOption.AccountSetup:
        return '';
    }
  }
}

class _BackButtonLogin extends StatelessWidget {
  const _BackButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    return Opacity(
      opacity: loginPageController.showBackButton ? 1 : 0,
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            handleBackBotton();
          },
          child: const Padding(
            padding: EdgeInsets.all(23),
            child: FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void handleBackBotton() {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    if (loginPageController.loginOption != LoginOption.AccountSetup) {
      loginPageController.loginOption = LoginOption.SignIn;
      loginPageController.clearFields();
    }
  }
}
