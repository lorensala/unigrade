import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:unigrade/core/constants.dart';

class SingInButton extends StatelessWidget {
  final Color color;
  final String label;
  final Color labelColor;
  final FaIcon icon;
  final Color borderColor;
  final VoidCallback onPressed;

  const SingInButton({
    Key? key,
    required this.color,
    required this.label,
    required this.labelColor,
    required this.icon,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        width: context.width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(26.0),
          color: color,
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: icon,
            ),
            const Spacer(),
            Text(
              label,
              style: TextStyle(
                fontFamily: AVENIR,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: labelColor,
              ),
              textAlign: TextAlign.left,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
