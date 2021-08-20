import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/domain/entities/subject.dart';

class MisNotasPageController extends GetxController {
  late TextEditingController textControllerSearch;
  late RxList<Subject> subjectsToShow;

  @override
  void onInit() {
    textControllerSearch = TextEditingController();
    final StudentController _studentController = Get.find<StudentController>();

    subjectsToShow = _studentController.student.subjects.obs;

    textControllerSearch.addListener(() {
      subjectsToShow = getSubjectsToShow(textControllerSearch.text).obs;
    });

    super.onInit();
  }

  List<Subject> getSubjectsToShow(String searchInput) {
    final StudentController _studentController = Get.find<StudentController>();
    final List<Subject> subjetList = <Subject>[];
    subjectsToShow.clear();

    _studentController.student.subjects.forEach((Subject subject) {
      subjetList.addIf(subject.name.contains(searchInput), subject);
    });

    return subjetList;
  }
}
