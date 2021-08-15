import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unigrade/core/constants.dart';

import 'package:unigrade/core/failures.dart';

class CustomAlertDialog extends StatelessWidget {
  final Failure failure;

  const CustomAlertDialog({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 225,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.0),
        color: const Color(0xffffffff),
      ),
      child: Column(
        children: <Widget>[
          const FaIcon(FontAwesomeIcons.exclamationCircle),
          const Text(
            '¡Error!',
            style: TextStyle(
              fontFamily: AVENIR,
              fontSize: 16,
              color: Color(0xff000000),
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            '', //failure.message,
            style: const TextStyle(
              fontFamily: 'Avenir LT Std',
              fontSize: 15,
              color: Color(0xff7c7979),
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.0),
              color: const Color(0xff000000),
            ),
            child: const Text(
              'Aceptar',
              style: TextStyle(
                fontFamily: AVENIR,
                fontSize: 16,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
