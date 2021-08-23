import 'package:get/get.dart';

import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/grade.dart';
import 'package:unigrade/domain/value/professorship.dart';

class SubjectController extends GetxController {
  late final Rx<Subject> _subject;

  Subject get subject => _subject.value;
  set subject(Subject subject) => _subject.value = subject;

  @override
  void onInit() {
    _subject = Subject(
      id: '',
      name: '',
      professorship: Professorship('1k1'),
      year: 0,
      gradesP: <Grade>[],
      gradesT: <Grade>[],
      gradesTP: <Grade>[],
      state: SubjectState.aprobada,
      icon: '',
      failings: <Grade>[],
      duration: SubjectDuration.anual,
      type: SubjectType.csbasica,
    ).obs;
    super.onInit();
  }

  void updateGrades() {}
}
