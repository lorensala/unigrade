import 'package:flutter/material.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/presentation/widgets/custom_title.dart';
import 'package:get/get.dart';

class ActivityBody extends StatelessWidget {
  const ActivityBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CustomTitle(title: 'Actividad'),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: context.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: const Color(0xfff7f7f7),
                    ),
                    child: const Text(
                      'Te sacaste un 9 en Análisis Matemático II',
                      style: TextStyle(
                        fontFamily: AVENIR,
                        fontSize: 18,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
