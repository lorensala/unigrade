import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/login_page_controller.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/core/constants.dart';
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
          height: 200,
          width: 200,
          child: Stack(
            children: <Widget>[
              Center(
                  child: CircleAvatar(
                radius: 100,
                onBackgroundImageError: (_, __) {},
                child: getImage(),
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
        CustomTextField(
            error: false,
            controller: loginPageController.textControllerNameSetup,
            hintText: 'Nombre',
            textInputType: TextInputType.name),
        const SizedBox(height: 20),
        _Button()
      ],
    );
  }

  Widget getImage() {
    final SignInController signInController = Get.find<SignInController>();

    if (signInController.firebaseAuth.currentUser!.photoURL != null) {
      try {
        return Image.network(
            signInController.firebaseAuth.currentUser!.photoURL!);
      } catch (e) {
        return SvgPicture.asset('assets/svg/default-profile-pic.svg');
        // Return a image not found image!!
      }
    } else {
      return SvgPicture.asset(
          'assets/svg/default-profile-pic.svg'); // TODO: fill the assets.
    }
  }
}

class _Button extends StatelessWidget {
  final LoginPageController loginPageController =
      Get.find<LoginPageController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
