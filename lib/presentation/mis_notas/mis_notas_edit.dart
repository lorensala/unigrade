import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:unigrade/controllers/data/subject_controller.dart';
import 'package:unigrade/controllers/presentation/mis_notas_edit_page_controller.dart';
import 'package:unigrade/core/colors.dart';
import 'package:unigrade/core/constants.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/presentation/widgets/back_button.dart';
import 'package:unigrade/presentation/widgets/custom_title.dart';
import 'package:unigrade/presentation/widgets/grade_card.dart';

class MisNotasEdit extends StatelessWidget {
  const MisNotasEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MisNotasEditPageController misMateriasEditPageController =
        Get.put(MisNotasEditPageController());

    final SubjectController subjectController = Get.find<SubjectController>();

    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            width: context.width,
            height: 780,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(
              children: <Widget>[
                const CustomBackButton(),
                const SizedBox(height: 20),
                const CustomTitle(
                  title: 'Mis Notas',
                ),
                const SizedBox(height: 15),
                Obx(() => GradeCard(
                    subject: subjectController.subject, tappeable: false)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 280,
                  width: context.width,
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          _CustomText(label: 'Teorico:'),
                          _CustomText(label: 'Practico:'),
                          _CustomText(label: 'TP:'),
                          _CustomText(label: 'Aplazos:'),
                          _CustomText(label: 'Final:'),
                        ],
                      ),
                      _GradesGrid(
                          misMateriasEditPageController:
                              misMateriasEditPageController),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const _CustomDropDownButton(),
                const SizedBox(height: 10),
                _SaveButton(subject: subjectController.subject)
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class _CustomDropDownButton extends StatelessWidget {
  const _CustomDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MisNotasEditPageController misNotasEditPageController =
        Get.find<MisNotasEditPageController>();

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(26.0)),
        child: Obx(
          () => DropdownButtonHideUnderline(
            child: DropdownButton<SubjectState>(
                value: misNotasEditPageController.dropDownValue,
                onChanged: misNotasEditPageController.isDropDownEnabled
                    ? (SubjectState? value) {
                        if (value != null) {
                          misNotasEditPageController.dropDownValue = value;
                        }
                      }
                    : null,
                hint: const Text('Condicion',
                    style: TextStyle(fontFamily: AVENIR)),
                items: dropdownItemValues
                    .map((SubjectState value) => DropdownMenuItem<SubjectState>(
                        value: value,
                        child: Text(
                          _getStateName(value),
                          style: const TextStyle(
                              fontFamily: AVENIR, fontWeight: FontWeight.w300),
                        )))
                    .toList()),
          ),
        ));
  }

  String _getStateName(SubjectState subjectState) {
    switch (subjectState) {
      case SubjectState.aprobada:
        return 'Aprobada';
      case SubjectState.regular:
        return 'Regular';
      case SubjectState.promocionPractica:
        return 'Promoción Práctica';
      case SubjectState.promocionTeorica:
        return 'Promoción Teórica';
    }
  }
}

class _GradesGrid extends StatelessWidget {
  const _GradesGrid({
    Key? key,
    required this.misMateriasEditPageController,
  }) : super(key: key);

  final MisNotasEditPageController misMateriasEditPageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _GradesRow(
          controller1: misMateriasEditPageController.textControllerGradeT1,
          controller2: misMateriasEditPageController.textControllerGradeT2,
          controller3: misMateriasEditPageController.textControllerGradeT3,
          controller4: misMateriasEditPageController.textControllerGradeT4,
          isFinalGrade: false,
          isFailing: false,
        ),
        _GradesRow(
          controller1: misMateriasEditPageController.textControllerGradeP1,
          controller2: misMateriasEditPageController.textControllerGradeP2,
          controller3: misMateriasEditPageController.textControllerGradeP3,
          controller4: misMateriasEditPageController.textControllerGradeP4,
          isFinalGrade: false,
          isFailing: false,
        ),
        _GradesRow(
          controller1: misMateriasEditPageController.textControllerGradeTP1,
          controller2: misMateriasEditPageController.textControllerGradeTP2,
          controller3: misMateriasEditPageController.textControllerGradeTP3,
          controller4: misMateriasEditPageController.textControllerGradeTP4,
          isFinalGrade: false,
          isFailing: false,
        ),
        _GradesRow(
          controller1: misMateriasEditPageController.textControllerGradeF1,
          controller2: misMateriasEditPageController.textControllerGradeF2,
          controller3: misMateriasEditPageController.textControllerGradeF3,
          controller4: misMateriasEditPageController.textControllerGradeF4,
          isFinalGrade: false,
          isFailing: true,
        ),
        _GradesRow(
          controller1: misMateriasEditPageController.textControllerFinalGrade,
          controller2: misMateriasEditPageController.textControllerGradeT2,
          controller3: misMateriasEditPageController.textControllerGradeT3,
          controller4: misMateriasEditPageController.textControllerGradeT4,
          isFinalGrade: true,
          isFailing: false,
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    final MisNotasEditPageController misMateriasEditPageController =
        Get.put(MisNotasEditPageController());
    return GestureDetector(
      onTap: () {
        if (misMateriasEditPageController.hasChanged) {
          misMateriasEditPageController.updateGrades(subject);
        }
      },
      child: Obx(
        () => Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.0),
            color: misMateriasEditPageController.hasChanged
                ? lightGreen
                : Colors.grey[300],
          ),
          child: Center(
            child: Text(misMateriasEditPageController.buttonLabel,
                style: TextStyle(
                  fontFamily: AVENIR,
                  fontSize: 18,
                  color: misMateriasEditPageController.hasChanged
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}

class _GradesRow extends StatelessWidget {
  const _GradesRow({
    Key? key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.controller4,
    required this.isFinalGrade,
    required this.isFailing,
  }) : super(key: key);

  final TextEditingController controller1;
  final TextEditingController? controller2;
  final TextEditingController? controller3;
  final TextEditingController? controller4;
  final bool isFinalGrade;
  final bool isFailing;

  @override
  Widget build(BuildContext context) {
    final MisNotasEditPageController misMateriasEditPageController =
        Get.put(MisNotasEditPageController());

    return SizedBox(
        height: 50,
        width: 280,
        child: Obx(
          () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: !isFinalGrade
                  ? <Widget>[
                      const SizedBox(width: 2),
                      _CustomTextField(
                        error: isFailing
                            ? !misMateriasEditPageController.isFailingValid1
                            : !misMateriasEditPageController.isGradeValid,
                        controller: controller1,
                        hintText: '',
                        textInputType: TextInputType.number,
                        regExp: REGEX_ONETOTEN,
                      ),
                      _CustomTextField(
                          error: isFailing
                              ? !misMateriasEditPageController.isFailingValid2
                              : !misMateriasEditPageController.isGradeValid,
                          controller: controller2!,
                          hintText: '',
                          textInputType: TextInputType.number,
                          regExp: REGEX_ONETOTEN),
                      _CustomTextField(
                          error: isFailing
                              ? !misMateriasEditPageController.isFailingValid3
                              : !misMateriasEditPageController.isGradeValid,
                          controller: controller3!,
                          hintText: '',
                          textInputType: TextInputType.number,
                          regExp: REGEX_ONETOTEN),
                      _CustomTextField(
                          error: isFailing
                              ? !misMateriasEditPageController.isFailingValid4
                              : !misMateriasEditPageController.isGradeValid,
                          controller: controller4!,
                          hintText: '',
                          textInputType: TextInputType.number,
                          regExp: REGEX_ONETOTEN),
                    ]
                  : <Widget>[
                      const SizedBox(width: 2),
                      _CustomTextField(
                          error:
                              !misMateriasEditPageController.isFinalGradeValid,
                          controller: controller1,
                          hintText: '',
                          textInputType: TextInputType.number,
                          regExp: REGEX_ONETOTEN),
                      const SizedBox(width: 190),
                    ]),
        ));
  }
}

class _CustomText extends StatelessWidget {
  const _CustomText({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 62,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(label,
            style: const TextStyle(
              fontFamily: AVENIR,
              fontSize: 15,
              color: Color(0xff000000),
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.right),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType textInputType;
  final bool? password;
  final TextEditingController controller;
  final bool error;
  final String regExp;

  const _CustomTextField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    this.password,
    required this.controller,
    required this.error,
    required this.regExp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: error
                ? Border.all(color: Colors.red)
                : Border.all(color: Colors.transparent),
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(26)),
        child: TextFormField(
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          maxLength: 2,
          controller: controller,
          obscureText: password ?? false,
          cursorColor: Colors.black,
          keyboardType: textInputType,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(regExp)),
          ],
          decoration: InputDecoration(
              counterText: '',
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
