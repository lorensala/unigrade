import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:unigrade/core/colors.dart';

enum CustomDialogType { ok, error }

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key, required this.type}) : super(key: key);

  final CustomDialogType type;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      content: Container(
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FaIcon(
              type == CustomDialogType.ok
                  ? FontAwesomeIcons.solidCheckCircle
                  : FontAwesomeIcons.exclamationCircle,
              color: type == CustomDialogType.ok
                  ? lightGreen
                  : const Color(0xFFFF6D6D),
              size: 130,
            ),
            FittedBox(
              child: Text(
                type == CustomDialogType.ok
                    ? 'Se han guardado los cambios!'
                    : 'Error',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Avenir LT Std',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Center(
                    child: Text(
                      'OK!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Avenir LT Std',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
