import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/helpers/routes.dart';

enum LoginOption { SignIn, Register, LoginEmail, RegisterEmail, AccountSetup }

class LoginPageController extends GetxController {
  final Rx<LoginOption> _loginOption = LoginOption.SignIn.obs;
  late final TextEditingController textControllerEmailRegister;
  late final TextEditingController textControllerEmailLogin;
  late final TextEditingController textControllerPasswordRegister;
  late final TextEditingController textControllerPasswordLogin;
  late final TextEditingController textControllerPasswordCopyRegister;
  late final TextEditingController textControllerNameSetup;
  final RxBool _invalidEmailRegister = false.obs;
  final RxBool _invalidEmailLogin = false.obs;
  final RxBool _passwordsDontMatch = false.obs;

  @override
  void onInit() {
    textControllerEmailRegister = TextEditingController();
    textControllerEmailLogin = TextEditingController();
    textControllerPasswordRegister = TextEditingController();
    textControllerPasswordLogin = TextEditingController();
    textControllerPasswordCopyRegister = TextEditingController();
    textControllerNameSetup = TextEditingController();

    textControllerEmailLogin.addListener(() {
      if (textControllerEmailLogin.text == '') {
        invalidEmailLogin = false;
      }
    });
    textControllerEmailRegister.addListener(() {
      if (textControllerEmailRegister.text == '') {
        invalidEmailRegister = false;
      }
    });
    textControllerPasswordCopyRegister.addListener(() {
      if (textControllerPasswordCopyRegister.text == '') {
        passwordsDontMatch = false;
      }
    });
    textControllerPasswordRegister.addListener(() {
      if (textControllerPasswordRegister.text == '') {
        passwordsDontMatch = false;
      }
    });

    super.onInit();
  }

  LoginOption get loginOption => _loginOption.value;
  bool get invalidEmailRegister => _invalidEmailRegister.value;
  bool get invalidEmailLogin => _invalidEmailLogin.value;
  bool get passwordsDontMatch => _passwordsDontMatch.value;
  String get textControllerNameSetupText => textControllerNameSetup.text;

  set invalidEmailRegister(bool value) => _invalidEmailRegister.value = value;
  set invalidEmailLogin(bool value) => _invalidEmailLogin.value = value;
  set passwordsDontMatch(bool value) => _passwordsDontMatch.value = value;
  set loginOption(LoginOption value) => _loginOption.value = value;

  set textControllerNameSetupText(String text) =>
      textControllerNameSetup.text = text;

  void navigateToLoginEmail() {
    loginOption = LoginOption.LoginEmail;
  }

  void navigateToRegisterEmail() {
    loginOption = LoginOption.RegisterEmail;
  }

  void navigateToRegister() {
    loginOption = LoginOption.Register;
  }

  void navigateToLogin() {
    loginOption = LoginOption.SignIn;
  }

  void navigateToAccountSetup() {
    loginOption = LoginOption.AccountSetup;
  }

  void navigateToHome() {
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {
    textControllerEmailRegister.dispose();
    textControllerEmailLogin.dispose();
    textControllerPasswordRegister.dispose();
    textControllerPasswordLogin.dispose();
    textControllerPasswordCopyRegister.dispose();
    textControllerNameSetup.dispose();
    super.onClose();
  }
}
