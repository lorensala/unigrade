import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        constraints: const BoxConstraints(maxWidth: 330),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(26.0),
          color: color,
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 25,
                height: 25,
                child: FittedBox(child: icon),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.centerLeft,
                width: 220,
                child: Center(
                  child: AutoSizeText(
                    label,
                    style: TextStyle(
                        fontFamily: AVENIR,
                        fontWeight: FontWeight.w800,
                        color: labelColor,
                        fontSize: 18,
                        height: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
