import 'package:animate_do/animate_do.dart';
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
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      content: ZoomIn(
        duration: const Duration(milliseconds: 100),
        child: SizedBox(
          height: 240,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(5, 3),
                            color: Colors.black26,
                            spreadRadius: 10)
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ZoomIn(
                        duration: const Duration(milliseconds: 100),
                        child: FaIcon(
                          type == CustomDialogType.ok
                              ? FontAwesomeIcons.solidCheckCircle
                              : FontAwesomeIcons.exclamationCircle,
                          color: type == CustomDialogType.ok
                              ? lightGreen
                              : const Color(0xFFFF6D6D),
                          size: 130,
                        ),
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
                            fontSize: 18,
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
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: const Center(
                              child: Text(
                                'Aceptar',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir LT Std',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
                    ],
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
