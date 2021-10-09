import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/login_page_controller.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/data/corr.dart';
import 'package:unigrade/data/subject_dao.dart';
import 'package:unigrade/domain/entities/student.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/nothing.dart';
import 'package:unigrade/helpers/helpers.dart';
import 'package:unigrade/presentation/widgets/custom_text_field.dart';

class AccountSetupPage extends StatelessWidget {
  const AccountSetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginPageController loginPageController =
        Get.find<LoginPageController>();

    final SignInController signInController = Get.find<SignInController>();

    loginPageController.textControllerNameSetupText =
        signInController.firebaseAuth.currentUser!.displayName ?? '';

    return Column(
      children: <Widget>[
        SizedBox(
          height: 180,
          width: 180,
          child: Stack(
            children: <Widget>[
              Center(
                  child: CircleAvatar(
                radius: 85,
                child: ClipOval(child: _getImage()),
              )),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: const BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffffffff),
                    ),
                    child: const Center(
                      child: FaIcon(FontAwesomeIcons.plus,
                          color: Colors.black, size: 22),
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => CustomTextField(
              error: loginPageController.invalidName,
              controller: loginPageController.textControllerNameSetup,
              hintText: 'Nombre',
              textInputType: TextInputType.name),
        ),
        const SizedBox(height: 20),
        _Button()
      ],
    );
  }

  Widget _getImage() {
    final SignInController signInController = Get.find<SignInController>();

    if (signInController.firebaseAuth.currentUser!.photoURL != null) {
      try {
        return Image.network(
            signInController.firebaseAuth.currentUser!.photoURL!,
            scale: 0.5);
      } catch (e) {
        return SvgPicture.asset('assets/svg/default-profile-pic.svg');
      }
    } else {
      return SvgPicture.asset('assets/svg/default-profile-pic.svg');
    }
  }
}

class _Button extends StatelessWidget {
  final LoginPageController loginPageController =
      Get.find<LoginPageController>();
  final SignInController signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (loginPageController.textControllerNameSetupText != '') {
          loginPageController.invalidName = false;
          loginPageController.errorMessage = '';

          loginPageController.isLoading = true;

          try {
            await updateDisplayName(
                loginPageController.textControllerNameSetupText.trim());
            loginPageController.navigateToHome();
          } catch (e) {
            loginPageController.invalidEmail = true;
            loginPageController.errorMessage = 'Error 404';
          }
        } else {
          loginPageController.invalidName = true;
          loginPageController.errorMessage = 'Please, enter a name.';
        }

        loginPageController.isLoading = false;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        width: context.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0), color: Colors.black),
        child: const Center(
          child: Text(
            'Siguiente',
            style: TextStyle(
              fontFamily: AVENIR,
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
