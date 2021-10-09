import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/controllers/data/subject_controller.dart';
import 'package:unigrade/controllers/presentation/mis_notas_page_controller.dart';
import 'package:unigrade/core/failures.dart';
import 'package:unigrade/data/subject_dao.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/grade.dart';
import 'package:unigrade/domain/value/nothing.dart';
import 'package:unigrade/presentation/widgets/custom_dialog.dart';

class MisNotasEditPageController extends GetxController {
  late final TextEditingController textControllerGradeT1;
  late final TextEditingController textControllerGradeT2;
  late final TextEditingController textControllerGradeT3;
  late final TextEditingController textControllerGradeT4;

  late final TextEditingController textControllerGradeP1;
  late final TextEditingController textControllerGradeP2;
  late final TextEditingController textControllerGradeP3;
  late final TextEditingController textControllerGradeP4;

  late final TextEditingController textControllerGradeTP1;
  late final TextEditingController textControllerGradeTP2;
  late final TextEditingController textControllerGradeTP3;
  late final TextEditingController textControllerGradeTP4;

  late final TextEditingController textControllerGradeF1;
  late final TextEditingController textControllerGradeF2;
  late final TextEditingController textControllerGradeF3;
  late final TextEditingController textControllerGradeF4;

  late final TextEditingController textControllerFinalGrade;

  String initValueGradeT1 = '';
  String initValueGradeT2 = '';
  String initValueGradeT3 = '';
  String initValueGradeT4 = '';

  String initValueGradeP1 = '';
  String initValueGradeP2 = '';
  String initValueGradeP3 = '';
  String initValueGradeP4 = '';

  String initValueGradeTP1 = '';
  String initValueGradeTP2 = '';
  String initValueGradeTP3 = '';
  String initValueGradeTP4 = '';

  String initValueGradeF1 = '';
  String initValueGradeF2 = '';
  String initValueGradeF3 = '';
  String initValueGradeF4 = '';

  String initValueFinalGrade = '';

  final RxBool _isDropDownEnabled = true.obs;
  final RxBool _isFinalGradeValid = true.obs;
  final RxBool _isFailingValid1 = true.obs;
  final RxBool _isFailingValid2 = true.obs;
  final RxBool _isFailingValid3 = true.obs;
  final RxBool _isFailingValid4 = true.obs;
  final RxBool _isGradeValid = true.obs;
  final Rx<SubjectState> _dropDownValue = SubjectState.regular.obs;
  final RxBool _hasChanged = false.obs;
  final RxBool _isLoading = false.obs;

  SubjectState get dropDownValue => _dropDownValue.value;
  bool get isDropDownEnabled => _isDropDownEnabled.value;
  bool get isFinalGradeValid => _isFinalGradeValid.value;
  bool get isFailingValid1 => _isFailingValid1.value;
  bool get isFailingValid2 => _isFailingValid2.value;
  bool get isFailingValid3 => _isFailingValid3.value;
  bool get isFailingValid4 => _isFailingValid4.value;
  bool get isGradeValid => _isGradeValid.value;
  bool get hasChanged => _hasChanged.value;
  bool get isLoading => _isLoading.value;

  set dropDownValue(SubjectState value) => _dropDownValue.value = value;

  @override
  void onInit() {
    textControllerGradeT1 = TextEditingController();
    textControllerGradeT2 = TextEditingController();
    textControllerGradeT3 = TextEditingController();
    textControllerGradeT4 = TextEditingController();

    textControllerGradeP1 = TextEditingController();
    textControllerGradeP2 = TextEditingController();
    textControllerGradeP3 = TextEditingController();
    textControllerGradeP4 = TextEditingController();

    textControllerGradeTP1 = TextEditingController();
    textControllerGradeTP2 = TextEditingController();
    textControllerGradeTP3 = TextEditingController();
    textControllerGradeTP4 = TextEditingController();

    textControllerGradeF1 = TextEditingController();
    textControllerGradeF2 = TextEditingController();
    textControllerGradeF3 = TextEditingController();
    textControllerGradeF4 = TextEditingController();

    textControllerFinalGrade = TextEditingController();

    getValues();

    textControllerFinalGrade.addListener(() {
      if (textControllerFinalGrade.text.isNotEmpty) {
        _isDropDownEnabled.value = false;

        if (int.parse(textControllerFinalGrade.text) > 5 &&
            int.parse(textControllerFinalGrade.text) < 11) {
          _isFinalGradeValid.value = true;
        } else {
          _isFinalGradeValid.value = false;
        }
      } else {
        _isDropDownEnabled.value = true;
        _isFinalGradeValid.value = true;
      }
    });

    // TODO: Check
    _isLoading.listen((bool value) {
      if (value) {
        Get.dialog(const SizedBox(
          width: 100,
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        ));
      } else {
        Get.back();
      }
    });

    textControllerGradeP1.addListener(() {
      _checkChange(textControllerGradeP1, initValueGradeP1, _hasChanged);
    });
    textControllerGradeP2.addListener(() {
      _checkChange(textControllerGradeP2, initValueGradeP2, _hasChanged);
    });
    textControllerGradeP3.addListener(() {
      _checkChange(textControllerGradeP3, initValueGradeP3, _hasChanged);
    });
    textControllerGradeP4.addListener(() {
      _checkChange(textControllerGradeP4, initValueGradeP4, _hasChanged);
    });

    textControllerGradeT1.addListener(() {
      _checkChange(textControllerGradeT1, initValueGradeT1, _hasChanged);
    });
    textControllerGradeT2.addListener(() {
      _checkChange(textControllerGradeT2, initValueGradeT2, _hasChanged);
    });
    textControllerGradeT3.addListener(() {
      _checkChange(textControllerGradeT3, initValueGradeT3, _hasChanged);
    });
    textControllerGradeT4.addListener(() {
      _checkChange(textControllerGradeT4, initValueGradeT4, _hasChanged);
    });

    textControllerGradeTP1.addListener(() {
      _checkChange(textControllerGradeTP1, initValueGradeTP1, _hasChanged);
    });
    textControllerGradeTP2.addListener(() {
      _checkChange(textControllerGradeTP2, initValueGradeTP2, _hasChanged);
    });
    textControllerGradeTP3.addListener(() {
      _checkChange(textControllerGradeTP3, initValueGradeTP3, _hasChanged);
    });
    textControllerGradeTP4.addListener(() {
      _checkChange(textControllerGradeTP4, initValueGradeTP4, _hasChanged);
    });

    textControllerGradeF1.addListener(() {
      _validateFailing(textControllerGradeF1, _isFailingValid1);
      _checkChange(textControllerGradeF1, initValueGradeF1, _hasChanged);
    });
    textControllerGradeF2.addListener(() {
      _validateFailing(textControllerGradeF2, _isFailingValid2);
      _checkChange(textControllerGradeF2, initValueGradeF2, _hasChanged);
    });

    textControllerGradeF3.addListener(() {
      _validateFailing(textControllerGradeF3, _isFailingValid3);
      _checkChange(textControllerGradeF3, initValueGradeF3, _hasChanged);
    });

    textControllerGradeF4.addListener(() {
      _validateFailing(textControllerGradeF4, _isFailingValid4);
      _checkChange(textControllerGradeF4, initValueGradeF4, _hasChanged);
    });

    super.onInit();
  }

  void _checkChange(
      TextEditingController controller, String value, RxBool flag) {
    if (controller.text != value) {
      flag.value = true;
    } else {
      flag.value = false;
    }
  }

  void _validateFailing(TextEditingController controller, RxBool flag) {
    if (controller.text.isNotEmpty) {
      if (int.parse(controller.text) > 0 && int.parse(controller.text) < 6) {
        flag.value = true;
      } else {
        flag.value = false;
      }
    } else {
      flag.value = true;
    }
  }

  @override
  void onClose() {
    textControllerGradeT1.dispose();
    textControllerGradeT2.dispose();
    textControllerGradeT3.dispose();
    textControllerGradeT4.dispose();

    textControllerGradeP1.dispose();
    textControllerGradeP2.dispose();
    textControllerGradeP3.dispose();
    textControllerGradeP4.dispose();

    textControllerGradeTP1.dispose();
    textControllerGradeTP2.dispose();
    textControllerGradeTP3.dispose();
    textControllerGradeTP4.dispose();

    textControllerGradeF1.dispose();
    textControllerGradeF2.dispose();
    textControllerGradeF3.dispose();
    textControllerGradeF4.dispose();

    textControllerFinalGrade.dispose();

    removeListener(() {});

    super.onClose();
  }

  Subject setValues() {
    final SubjectController subjectController = Get.find<SubjectController>();

    final List<Grade> gradesT = <Grade>[
      if (textControllerGradeT1.text != '')
        Grade(int.parse(textControllerGradeT1.text)),
      if (textControllerGradeT2.text != '')
        Grade(int.parse(textControllerGradeT2.text)),
      if (textControllerGradeT3.text != '')
        Grade(int.parse(textControllerGradeT3.text)),
      if (textControllerGradeT4.text != '')
        Grade(int.parse(textControllerGradeT4.text)),
    ];

    final List<Grade> gradesP = <Grade>[
      if (textControllerGradeP1.text != '')
        Grade(int.parse(textControllerGradeP1.text)),
      if (textControllerGradeP2.text != '')
        Grade(int.parse(textControllerGradeP2.text)),
      if (textControllerGradeP3.text != '')
        Grade(int.parse(textControllerGradeP3.text)),
      if (textControllerGradeP4.text != '')
        Grade(int.parse(textControllerGradeP4.text)),
    ];

    final List<Grade> gradesTP = <Grade>[
      if (textControllerGradeTP1.text != '')
        Grade(int.parse(textControllerGradeTP1.text)),
      if (textControllerGradeTP2.text != '')
        Grade(int.parse(textControllerGradeTP2.text)),
      if (textControllerGradeTP3.text != '')
        Grade(int.parse(textControllerGradeTP3.text)),
      if (textControllerGradeTP4.text != '')
        Grade(int.parse(textControllerGradeTP4.text)),
    ];

    final List<Grade> failings = <Grade>[
      if (textControllerGradeF1.text != '')
        Grade(int.parse(textControllerGradeF1.text)),
      if (textControllerGradeF2.text != '')
        Grade(int.parse(textControllerGradeF2.text)),
      if (textControllerGradeF3.text != '')
        Grade(int.parse(textControllerGradeF3.text)),
      if (textControllerGradeF4.text != '')
        Grade(int.parse(textControllerGradeF4.text)),
    ];

    if (textControllerFinalGrade.text.isNotEmpty) {
      final Grade finalGrade = Grade(int.parse(textControllerFinalGrade.text));
      return subjectController.subject.copyWith(
          gradesP: gradesP,
          gradesT: gradesT,
          gradesTP: gradesTP,
          failings: failings,
          finalGrade: finalGrade,
          state: SubjectState.aprobada);
    } else {
      return subjectController.subject.copyWith(
          gradesP: gradesP,
          gradesT: gradesT,
          gradesTP: gradesTP,
          failings: failings,
          state: dropDownValue);
    }
  }

  void getValues() {
    final SubjectController subjectController = Get.find<SubjectController>();

    final int countT = subjectController.subject.gradesT.length;
    final int countP = subjectController.subject.gradesP.length;
    final int countTP = subjectController.subject.gradesTP.length;
    final int countF = subjectController.subject.failings.length;

    //TODO: Simplify in one function.

    for (int i = 0; i < countT; i++) {
      if (i == 0) {
        textControllerGradeT1.text =
            subjectController.subject.gradesT[0].grade.toString();
        initValueGradeT1 = textControllerGradeT1.text;
      } else if (i == 1) {
        textControllerGradeT2.text =
            subjectController.subject.gradesT[1].grade.toString();
        initValueGradeT2 = textControllerGradeT2.text;
      } else if (i == 2) {
        textControllerGradeT3.text =
            subjectController.subject.gradesT[2].grade.toString();
        initValueGradeT3 = textControllerGradeT3.text;
      } else if (i == 3) {
        textControllerGradeT4.text =
            subjectController.subject.gradesT[3].grade.toString();
        initValueGradeT4 = textControllerGradeT4.text;
      }
    }

    for (int i = 0; i < countP; i++) {
      if (i == 0) {
        textControllerGradeP1.text =
            subjectController.subject.gradesP[0].grade.toString();
        initValueGradeP1 = textControllerGradeP1.text;
      } else if (i == 1) {
        textControllerGradeP2.text =
            subjectController.subject.gradesP[1].grade.toString();
        initValueGradeP2 = textControllerGradeP2.text;
      } else if (i == 2) {
        textControllerGradeP3.text =
            subjectController.subject.gradesP[2].grade.toString();
        initValueGradeP3 = textControllerGradeP3.text;
      } else if (i == 3) {
        textControllerGradeP4.text =
            subjectController.subject.gradesP[3].grade.toString();
        initValueGradeP4 = textControllerGradeP4.text;
      }
    }

    for (int i = 0; i < countTP; i++) {
      if (i == 0) {
        textControllerGradeTP1.text =
            subjectController.subject.gradesTP[0].grade.toString();
        initValueGradeTP1 = textControllerGradeTP1.text;
      } else if (i == 1) {
        textControllerGradeTP2.text =
            subjectController.subject.gradesTP[1].grade.toString();
        initValueGradeTP2 = textControllerGradeTP2.text;
      } else if (i == 2) {
        textControllerGradeTP3.text =
            subjectController.subject.gradesTP[2].grade.toString();
        initValueGradeTP3 = textControllerGradeTP3.text;
      } else if (i == 3) {
        textControllerGradeTP4.text =
            subjectController.subject.gradesTP[3].grade.toString();
        initValueGradeTP4 = textControllerGradeTP4.text;
      }
    }
    for (int i = 0; i < countF; i++) {
      if (i == 0) {
        textControllerGradeF1.text =
            subjectController.subject.failings[0].grade.toString();
        initValueGradeF1 = textControllerGradeF1.text;
      } else if (i == 1) {
        textControllerGradeF2.text =
            subjectController.subject.failings[1].grade.toString();
        initValueGradeF2 = textControllerGradeF2.text;
      } else if (i == 2) {
        textControllerGradeF3.text =
            subjectController.subject.failings[2].grade.toString();
        initValueGradeF3 = textControllerGradeF3.text;
      } else if (i == 3) {
        textControllerGradeF4.text =
            subjectController.subject.failings[3].grade.toString();
        initValueGradeF4 = textControllerGradeF4.text;
      }
    }

    if (subjectController.subject.finalGrade != null) {
      textControllerFinalGrade.text =
          subjectController.subject.finalGrade!.grade.toString();
      initValueFinalGrade = textControllerFinalGrade.text;
    } else {
      dropDownValue = subjectController.subject.state!;
    }
  }

  bool _allValid() {
    return isFailingValid1 &&
        isFailingValid2 &&
        isFailingValid3 &&
        isFailingValid4 &&
        isFinalGradeValid &&
        isGradeValid;
  }

  void updateGrades(Subject subject) {
    if (_allValid()) {
      _isLoading.value = true;
      final MisNotasPageController misNotasPageController =
          Get.find<MisNotasPageController>();
      final SubjectController subjectController = Get.find<SubjectController>();
      final StudentController studentController = Get.find<StudentController>();

      final Subject tempSubject = setValues();

      subjectController.subject = tempSubject;
      misNotasPageController.subjectsToShow[subject.id - 1] = tempSubject;
      studentController.student.subjects[subject.id - 1] = tempSubject;

      SubjectsDao.instance
          .update(tempSubject)
          .then((Either<Failure, Nothing> value) {
        _isLoading.value = false;
        return value.fold(
            (Failure f) =>
                Get.dialog(const CustomDialog(type: CustomDialogType.error)),
            (Nothing nothing) {
          _updateInitValues();
          return Get.dialog(const CustomDialog(
            type: CustomDialogType.ok,
          ));
        });
      });
    }
  }

  void _updateInitValues() {
    initValueGradeT1 = textControllerGradeT1.text;
    initValueGradeT2 = textControllerGradeT2.text;
    initValueGradeT3 = textControllerGradeT3.text;
    initValueGradeT4 = textControllerGradeT4.text;
    initValueGradeP1 = textControllerGradeP1.text;
    initValueGradeP2 = textControllerGradeP2.text;
    initValueGradeP3 = textControllerGradeP3.text;
    initValueGradeP4 = textControllerGradeP4.text;
    initValueGradeTP1 = textControllerGradeTP1.text;
    initValueGradeTP2 = textControllerGradeTP2.text;
    initValueGradeTP3 = textControllerGradeTP3.text;
    initValueGradeTP4 = textControllerGradeTP4.text;
    initValueGradeF1 = textControllerGradeF1.text;
    initValueGradeF2 = textControllerGradeF2.text;
    initValueGradeF3 = textControllerGradeF3.text;
    initValueGradeF4 = textControllerGradeF4.text;
    initValueFinalGrade = textControllerFinalGrade.text;
  }
}
