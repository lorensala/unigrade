import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unigrade/core/constants.dart';

import 'package:get/get.dart';
import 'package:unigrade/core/failures.dart';

class CustomAlertDialog extends StatelessWidget {
  final Failure failure;

  const CustomAlertDialog({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(26.0))),
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        width: context.width,
        height: 240,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: const Color(0xFFFFFFFF)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FaIcon(
                FontAwesomeIcons.exclamationCircle,
                size: 65,
                color: Color(0xffFF6F6F),
              ),
              const Text(
                '¡Error!',
                style: TextStyle(
                  fontFamily: AVENIR,
                  fontSize: 20,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                '', //failure.message,
                style: TextStyle(
                  fontFamily: 'Avenir LT Std',
                  fontSize: 15,
                  color: Color(0xff7c7979),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Container(
                height: 30,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.0),
                  color: const Color(0xff000000),
                ),
                child: const Center(
                  child: Text(
                    'Aceptar',
                    style: TextStyle(
                      fontFamily: AVENIR,
                      fontSize: 16,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
