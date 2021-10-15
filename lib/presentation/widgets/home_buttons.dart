import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:unigrade/core/constants.dart';

class HomeButton extends StatefulWidget {
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
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  AutoSizeGroup textGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(widget.route),
      child: Stack(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(
                minWidth: 120, minHeight: 150, maxWidth: 220, maxHeight: 150),
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              width: context.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: widget.color,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              constraints: const BoxConstraints(),
              margin: const EdgeInsets.only(left: 15),
              alignment: Alignment.bottomLeft,
              height: context.height / 11,
              width: context.width / 3,
              child: AutoSizeText(
                widget.text,
                group: textGroup,
                style: const TextStyle(
                  fontFamily: AVENIR,
                  fontSize: 22,
                  color: Color(0xff484848),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 30,
            child: SvgPicture.asset(
              widget.icon,
              width: 74.0,
              height: 74.0,
            ),
          )
        ],
      ),
    );
  }
}
