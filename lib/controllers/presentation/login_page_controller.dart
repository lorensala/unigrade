import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/helpers/routes.dart';
import 'package:unigrade/presentation/widgets/custom_waiting_dialog.dart';

enum LoginOption { SignIn, Register, LoginEmail, RegisterEmail, AccountSetup }

class LoginPageController extends GetxController {
  final Rx<LoginOption> _loginOption = LoginOption.SignIn.obs;
  late final TextEditingController textControllerEmailRegister;
  late final TextEditingController textControllerEmailLogin;
  late final TextEditingController textControllerPasswordRegister;
  late final TextEditingController textControllerPasswordLogin;
  late final TextEditingController textControllerPasswordCopyRegister;
  late final TextEditingController textControllerNameSetup;
  final RxBool _invalidEmail = false.obs;
  final RxBool _invalidPassword = false.obs;
  final RxBool _passwordsDontMatch = false.obs;
  final RxBool _invalidName = false.obs;
  final RxString _errorMessage = ''.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _showBackButton = true.obs;

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
        invalidEmail = false;
      }
    });

    textControllerEmailRegister.addListener(() {
      if (textControllerEmailRegister.text == '') {
        invalidEmail = false;
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

    textControllerNameSetup.addListener(() {
      if (textControllerNameSetup.text == '') {
        invalidName = false;
      }
    });

    super.onInit();
  }

  // void handleException() {
  //   if (invalidEmail) {
  //     //_currentFailure.value = InvalidEmailFailure();
  //   } else if (invalidPassword) {
  //     //_currentFailure.value = InvalidPasswordFailure();
  //   }
  // }

  bool get isLoading => _isLoading.value;
  LoginOption get loginOption => _loginOption.value;
  bool get invalidEmail => _invalidEmail.value;
  bool get invalidPassword => _invalidPassword.value;
  bool get passwordsDontMatch => _passwordsDontMatch.value;
  bool get invalidName => _invalidName.value;
  bool get showBackButton => _showBackButton.value;
  String get textControllerNameSetupText => textControllerNameSetup.text;
  String get errorMessage => _errorMessage.value;

  set isLoading(bool value) {
    _isLoading.value = value;
    if (value) {
      Get.dialog(const CustomWaitingDialog());
    } else {
      Get.back();
    }
  }

  set invalidEmail(bool value) => _invalidEmail.value = value;
  set invalidPassword(bool value) => _invalidPassword.value = value;
  set passwordsDontMatch(bool value) => _passwordsDontMatch.value = value;
  set loginOption(LoginOption value) => _loginOption.value = value;
  set errorMessage(String value) => _errorMessage.value = value;
  set invalidName(bool value) => _invalidName.value = value;
  set showBackButton(bool value) => _showBackButton.value = value;

  set textControllerNameSetupText(String text) =>
      textControllerNameSetup.text = text;

  void navigateToLoginEmail() {
    loginOption = LoginOption.LoginEmail;
    _clearFields();
  }

  void navigateToRegisterEmail() {
    loginOption = LoginOption.RegisterEmail;
    _clearFields();
  }

  void navigateToRegister() {
    loginOption = LoginOption.Register;
    _clearFields();
  }

  void navigateToLogin() {
    loginOption = LoginOption.SignIn;
    _clearFields();
  }

  void navigateToAccountSetup() {
    loginOption = LoginOption.AccountSetup;
    _clearFields();
  }

  void navigateToHome() {
    Get.offAllNamed(Routes.HOME);
    _clearFields();
  }

  void _clearFields() {
    textControllerEmailRegister.text = '';
    textControllerEmailLogin.text = '';
    textControllerPasswordRegister.text = '';
    textControllerPasswordLogin.text = '';
    textControllerPasswordCopyRegister.text = '';
    textControllerNameSetup.text = '';
    errorMessage = '';
    invalidEmail = false;
    invalidPassword = false;
    passwordsDontMatch = false;
    invalidName = false;
    errorMessage = '';
    isLoading = false;
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
