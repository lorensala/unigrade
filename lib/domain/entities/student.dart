import 'package:flutter/foundation.dart';
import 'package:unigrade/domain/entities/subject.dart';

class Student extends ChangeNotifier {
  String fullname;
  String uid;
  String photoURL;
  List<Subject> subjects;

  Student({
    required this.fullname,
    required this.uid,
    required this.photoURL,
    required this.subjects,
  });

  double getAvgNoFailings() {
    final int count = subjects.length;
    int sum = 0;

    subjects.forEach((Subject subject) {
      if (subject.passed) {
        sum += subject.finalGrade!.grade;
      }
    });

    return sum * 100 / count;
  }

  double getAvgFailings() {
    final int count = subjects.length;
    int sum = 0;

    subjects.forEach((Subject subject) {
      if (subject.passed) {
        sum += subject.finalGrade!.grade;
      }
    });

    return sum / count;
  }

  double getAvgWithFailings() {
    final int count = subjects.length;
    int sum = 0;

    subjects.forEach((Subject subject) {
      if (subject.finalGrade != null) {
        sum += subject.finalGrade!.grade;
      }
    });

    return sum / count;
  }

  int getPassed() {
    int subjectsLeft = 0;

    subjects.forEach((Subject subject) {
      if (subject.passed) {
        subjectsLeft += 1;
      }
    });

    return subjectsLeft;
  }

  int getLeft() {
    int subjectsLeft = 0;

    subjects.forEach((Subject subject) {
      if (!subject.passed) {
        subjectsLeft += 1;
      }
    });

    return subjectsLeft;
  }
}
