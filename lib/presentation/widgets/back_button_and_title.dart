import 'package:flutter/material.dart';
import 'package:unigrade/presentation/widgets/back_button.dart';
import 'package:unigrade/presentation/widgets/custom_title.dart';

class BackButtonAndTitle extends StatelessWidget {
  const BackButtonAndTitle({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: <Widget>[
          const CustomBackButton(),
          const Spacer(),
          CustomTitle(title: label),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
