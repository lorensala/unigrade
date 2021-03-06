import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/subject_controller.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/presentation/widgets/back_button_and_title.dart';
import 'package:unigrade/presentation/widgets/grade_card.dart';
import 'package:unigrade/presentation/widgets/subject_card.dart';

class MisMateriasInfoPage extends StatelessWidget {
  const MisMateriasInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SubjectController subjectController = Get.put(SubjectController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const BackButtonAndTitle(label: 'Mis Materias'),
                SubjectCard(
                    subject: subjectController.subject, tappable: false),
                const SizedBox(height: 10),
                const _GeneralInfo(),
                const SizedBox(height: 10),
                const _GradesInfo(),
                const SizedBox(height: 10),
                SizedBox(height: context.mediaQueryPadding.bottom),
                //const _Correlatives(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DifficultyInfo extends StatelessWidget {
  const _DifficultyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Dificultad',
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 22,
            color: Color(0xff000000),
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: Row(
            children: <Widget>[
              const _DifficultyInfoText(),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  _StarsRow(),
                  _StarsRow(),
                  _StarsRow(),
                  _StarsRow(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _StarsRow extends StatelessWidget {
  const _StarsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          FaIcon(FontAwesomeIcons.solidStar, size: 30, color: Colors.amber),
          FaIcon(FontAwesomeIcons.solidStar, size: 30, color: Colors.amber),
          FaIcon(FontAwesomeIcons.solidStar, size: 30, color: Colors.amber),
          FaIcon(FontAwesomeIcons.star, size: 30),
          FaIcon(FontAwesomeIcons.star, size: 30),
        ],
      ),
    );
  }
}

class _DifficultyInfoText extends StatelessWidget {
  const _DifficultyInfoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const <Widget>[
        Text(
          'Regularizar:',
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 22,
            color: Color(0xff000000),
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          'Promocionar:',
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 22,
            color: Color(0xff000000),
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          'Ap. Directa:',
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 22,
            color: Color(0xff000000),
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          'Final:',
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 22,
            color: Color(0xff000000),
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}

class _Correlatives extends StatelessWidget {
  const _Correlatives({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Correlativas',
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 22,
            color: Color(0xff000000),
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.left,
        ),
        const Text(
          'Para cursar',
          style: TextStyle(
            fontFamily: AVENIR,
            fontSize: 18,
            color: Color(0xff000000),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

class _GradesInfo extends StatelessWidget {
  const _GradesInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SubjectController subjectController = Get.put(SubjectController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradeCard(subject: subjectController.subject, tappeable: true),
      ],
    );
  }
}

class _GeneralInfo extends StatelessWidget {
  const _GeneralInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SubjectController subjectController = Get.put(SubjectController());

    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Informaci??n general',
            style: TextStyle(
              fontFamily: AVENIR,
              fontSize: 22,
              color: Color(0xff000000),
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Estado: ${(subjectController.subject.state != null) ? _getStateName(subjectController.subject.state!) : '-'}',
            style: const TextStyle(
              fontFamily: AVENIR,
              fontSize: 19,
              color: Color(0xff8d8d8d),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Electiva: ${subjectController.subject.electiva ? 'Si' : 'No'}',
            style: const TextStyle(
              fontFamily: AVENIR,
              fontSize: 19,
              color: Color(0xff8d8d8d),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'A??o: ${subjectController.subject.year}',
            style: const TextStyle(
              fontFamily: AVENIR,
              fontSize: 19,
              color: Color(0xff8d8d8d),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          // Text(
          //   'Curso: ${subjectController.subject.professorship.professorship}',
          //   style: const TextStyle(
          //     fontFamily: AVENIR,
          //     fontSize: 19,
          //     color: Color(0xff8d8d8d),
          //     fontWeight: FontWeight.w700,
          //   ),
          //   textAlign: TextAlign.left,
          // ),
        ],
      ),
    );
  }

  String _getStateName(SubjectState state) {
    switch (state) {
      case SubjectState.aprobada:
        return 'Aprobada';
      case SubjectState.regular:
        return 'Regular';
      case SubjectState.promocionPractica:
        return 'Promoci??n Pr??ctica';
      case SubjectState.promocionTeorica:
        return 'Promoci??n Te??rica';
    }
  }
}
