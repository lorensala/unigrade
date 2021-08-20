import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.hintText,
    required this.textInputType,
    this.password,
    required this.controller,
    required this.error,
  }) : super(key: key);

  final String? hintText;
  final TextInputType textInputType;
  final bool? password;
  final TextEditingController controller;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: context.width,
        decoration: BoxDecoration(
            border: error
                ? Border.all(color: Colors.red)
                : Border.all(color: Colors.transparent),
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(26)),
        child: Row(children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: password ?? false,
              cursorColor: Colors.black,
              keyboardType: textInputType,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                      left: 15, bottom: 11, top: 11, right: 15),
                  hintText: hintText),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, bottom: 3),
            child: const FaIcon(
              FontAwesomeIcons.search,
              color: Color(0xFFAFAFAF),
              size: 20,
            ),
          )
        ]));
  }
}
