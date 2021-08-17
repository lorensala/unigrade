import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unigrade/core/constants.dart';
import 'package:get/get.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  final String route;

  const HomeButton(
      {required this.route,
      required this.text,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              width: 160,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: color,
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(17, 55, 0, 0),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: AVENIR,
                    fontSize: 19,
                    color: Color(0xff484848),
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 40,
            child: SvgPicture.asset(
              icon,
              width: 74.0,
              height: 74.0,
            ),
          )
        ],
      ),
    );
  }
}
