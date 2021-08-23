import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';

import 'package:unigrade/controllers/data/subject_controller.dart';
import 'package:unigrade/controllers/presentation/mis_notas_edit_page_controller.dart';
import 'package:unigrade/controllers/presentation/mis_notas_page_controller.dart';
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

    misMateriasEditPageController.getGrades();
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: context.width,
          height: context.height,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _GradesRow(
                          controller1: misMateriasEditPageController
                              .textControllerGradeT1,
                          controller2: misMateriasEditPageController
                              .textControllerGradeT2,
                          controller3: misMateriasEditPageController
                              .textControllerGradeT3,
                          controller4: misMateriasEditPageController
                              .textControllerGradeT4,
                          isFinalGrade: false,
                        ),
                        _GradesRow(
                          controller1: misMateriasEditPageController
                              .textControllerGradeP1,
                          controller2: misMateriasEditPageController
                              .textControllerGradeP2,
                          controller3: misMateriasEditPageController
                              .textControllerGradeP3,
                          controller4: misMateriasEditPageController
                              .textControllerGradeP4,
                          isFinalGrade: false,
                        ),
                        _GradesRow(
                          controller1: misMateriasEditPageController
                              .textControllerGradeTP1,
                          controller2: misMateriasEditPageController
                              .textControllerGradeTP2,
                          controller3: misMateriasEditPageController
                              .textControllerGradeTP3,
                          controller4: misMateriasEditPageController
                              .textControllerGradeTP4,
                          isFinalGrade: false,
                        ),
                        _GradesRow(
                          controller1: misMateriasEditPageController
                              .textControllerGradeF1,
                          controller2: misMateriasEditPageController
                              .textControllerGradeF2,
                          controller3: misMateriasEditPageController
                              .textControllerGradeF3,
                          controller4: misMateriasEditPageController
                              .textControllerGradeF4,
                          isFinalGrade: false,
                        ),
                        _GradesRow(
                          controller1: misMateriasEditPageController
                              .textControllerFinalGrade,
                          controller2: misMateriasEditPageController
                              .textControllerGradeT2,
                          controller3: misMateriasEditPageController
                              .textControllerGradeT3,
                          controller4: misMateriasEditPageController
                              .textControllerGradeT4,
                          isFinalGrade: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              _SaveButton(subject: subjectController.subject)
            ],
          ),
        ),
      )),
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
    final MisNotasEditPageController misNotasEditPageController =
        Get.find<MisNotasEditPageController>();
    final SubjectController subjectController = Get.find<SubjectController>();

    return GestureDetector(
      onTap: () {
        _updateGrades(misNotasEditPageController, subjectController);
      },
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.0),
          color: const Color(0xffa7ffad),
        ),
        child: const Center(
          child: Text('Guardar Cambios',
              style: TextStyle(
                fontFamily: AVENIR,
                fontSize: 18,
                color: Color(0xff000000),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }

  void _updateGrades(MisNotasEditPageController misNotasEditPageController,
      SubjectController subjectController) {
    final Subject tempSubject = misNotasEditPageController.setGrades();
    final StudentController studentController = Get.find<StudentController>();
    final MisNotasPageController misNotasPageController =
        Get.find<MisNotasPageController>();

    subjectController.subject = tempSubject;
    misNotasPageController.subjectsToShow[0] = tempSubject;
    studentController.student.subjects[0] = tempSubject;
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
  }) : super(key: key);

  final TextEditingController controller1;
  final TextEditingController? controller2;
  final TextEditingController? controller3;
  final TextEditingController? controller4;
  final bool isFinalGrade;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 280,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: !isFinalGrade
                ? <Widget>[
                    const SizedBox(width: 2),
                    _CustomTextField(
                        error: false,
                        controller: controller1,
                        hintText: '',
                        textInputType: TextInputType.number),
                    _CustomTextField(
                        error: false,
                        controller: controller2!,
                        hintText: '',
                        textInputType: TextInputType.number),
                    _CustomTextField(
                        error: false,
                        controller: controller3!,
                        hintText: '',
                        textInputType: TextInputType.number),
                    _CustomTextField(
                        error: false,
                        controller: controller4!,
                        hintText: '',
                        textInputType: TextInputType.number),
                  ]
                : <Widget>[
                    const SizedBox(width: 2),
                    _CustomTextField(
                        error: false,
                        controller: controller1,
                        hintText: '',
                        textInputType: TextInputType.number),
                    const SizedBox(width: 190),
                  ]));
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

  const _CustomTextField({
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
            FilteringTextInputFormatter.allow(
                RegExp(r'''^(?:[1-9]|0[1-9]|10)$''')),
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
