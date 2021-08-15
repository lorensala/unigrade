import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType textInputType;
  final bool? password;
  final TextEditingController controller;
  final bool error;

  const CustomTextField({
    Key? key,
    required this.error,
    required this.controller,
    this.password,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        height: 50,
        width: context.width,
        decoration: BoxDecoration(
            border: error
                ? Border.all(color: Colors.red)
                : Border.all(color: Colors.transparent),
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(26)),
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
        ));
  }
}
