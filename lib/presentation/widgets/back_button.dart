import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          handleBackBotton();
        },
        child: const FaIcon(
          FontAwesomeIcons.chevronLeft,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }

  void handleBackBotton() {
    Get.back();
  }
}
