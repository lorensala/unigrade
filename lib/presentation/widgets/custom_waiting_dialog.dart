import 'package:flutter/material.dart';

class CustomWaitingDialog extends StatelessWidget {
  const CustomWaitingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
        elevation: 0,
        contentPadding: EdgeInsets.symmetric(horizontal: 100),
        backgroundColor: Colors.transparent,
        content: SizedBox(
          height: 80,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
            strokeWidth: 5,
            //color: Colors.lightBlue,
          ),
        ));
  }
}
