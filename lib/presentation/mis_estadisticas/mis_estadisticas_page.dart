import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/core/colors.dart';

import 'package:unigrade/core/constants.dart';
import 'package:unigrade/presentation/widgets/back_button_and_title.dart';
import 'package:unigrade/presentation/widgets/student_profe_picture.dart';

class MisEstadisticasPage extends StatelessWidget {
  const MisEstadisticasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                const BackButtonAndTitle(label: 'Mis Estadísticas'),
                const SizedBox(height: 20),
                const StudentProfilePicture(radius: 80),
                const SizedBox(height: 20),
                const _Chips(),
                const SizedBox(height: 20),
                const _Header(label: 'Promedios'),
                const SizedBox(height: 10),
                const _StatsRowAvg(),
                const SizedBox(height: 10),
                const _Header(label: 'General'),
                const SizedBox(height: 10),
                const _StatsRowGeneral(),
                const SizedBox(height: 10),
                const _Header(label: 'Materias'),
                const SizedBox(height: 10),
                const _StatsRowSubjects(),
                SizedBox(height: context.mediaQueryPadding.bottom)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatsRowSubjects extends StatelessWidget {
  const _StatsRowSubjects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find<StudentController>();

    return SizedBox(
      width: 280,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _StatContainer(
                label: 'Materias\naprobadas',
                value: studentController.passed.value.toString(),
                color: lightPurple,
                textColor: Colors.black,
              ),
              _StatContainer(
                label: 'Materias\nfaltantes',
                value: studentController.left.value.toString(),
                color: lightPurple,
                textColor: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _StatContainer(
                label: 'Promoción\npráctica',
                value: studentController.promoP.value.toString(),
                color: lightPurple,
                textColor: Colors.black,
              ),
              _StatContainer(
                label: 'Promoción\nteórica',
                value: studentController.promoT.value.toString(),
                color: lightPurple,
                textColor: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _StatContainer(
                label: 'Regulares',
                value: studentController.reg.value.toString(),
                color: lightPurple,
                textColor: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatsRowGeneral extends StatelessWidget {
  const _StatsRowGeneral({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find<StudentController>();

    return SizedBox(
      width: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _StatContainer(
            label: 'Cantidad\naplazos',
            value: studentController.avgNoFailing.value.toString(),
            color: lightYellow,
            textColor: Colors.black,
          ),
          _StatContainer(
            label: 'Carrera\ncompletada',
            value: studentController.avgFailing.value.toString(),
            color: lightYellow,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

class _StatsRowAvg extends StatelessWidget {
  const _StatsRowAvg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find<StudentController>();

    return SizedBox(
      width: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _StatContainer(
            label: 'Promedio\n sin aplazos',
            value: studentController.avgNoFailing.value.toString(),
            color: lightBlue,
            textColor: Colors.white,
          ),
          _StatContainer(
              label: 'Promedio\n con aplazos',
              value: studentController.avgFailing.value.toString(),
              color: lightBlue,
              textColor: Colors.white)
        ],
      ),
    );
  }
}

class _StatContainer extends StatelessWidget {
  const _StatContainer(
      {Key? key,
      required this.label,
      required this.value,
      required this.color,
      required this.textColor})
      : super(key: key);

  final String label;
  final String value;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 125,
        width: 125,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(26)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Avenir LT Std',
                fontSize: 37,
                color: textColor,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Avenir LT Std',
                fontSize: 13,
                color: textColor,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: AVENIR,
        fontSize: 15,
        color: Color(0xff000000),
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _Chips extends StatelessWidget {
  const _Chips({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          _CustomChip(
            label: 'General',
            isPressed: true,
          ),
          _CustomChip(
            label: 'Por año',
            isPressed: false,
          ),
        ],
      ),
    );
  }
}

class _CustomChip extends StatelessWidget {
  const _CustomChip({
    Key? key,
    required this.label,
    required this.isPressed,
  }) : super(key: key);

  final String label;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
          color: isPressed ? const Color(0xff000000) : const Color(0xfff2f2f2),
          borderRadius: BorderRadius.circular(26)),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 12,
            color:
                isPressed ? const Color(0xffffffff) : const Color(0xff000000),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
