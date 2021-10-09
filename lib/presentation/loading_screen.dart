import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unigrade/core/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          _IconLogo(),
          SizedBox(height: 30),
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
              strokeWidth: 5,
              //color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconLogo extends StatelessWidget {
  const _IconLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 250, width: 250, child: SvgPicture.asset(LOGOASSET)),
        const Text(
          '¡Organiza tu carrera!',
          style: TextStyle(
              fontFamily: AVENIR, fontSize: 25, color: Color(0xFF7C7979)),
        ),
      ],
    );
  }
}
