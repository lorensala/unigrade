import 'package:unigrade/domain/entities/subject.dart';

class Student {
  Student({
    required this.fullname,
    required this.uid,
    required this.photoURL,
    required this.subjects,
  });

  // Fullname of student
  String fullname;

  // Unique ID of the student.
  String uid;

  // Photo url.
  String photoURL;

  // List of all student subjects.
  List<Subject> subjects;

  double getAvgNoFailings() {
    final int count = subjects.length;
    int sum = 0;

    subjects.forEach((Subject subject) {
      if (subject.passed) {
        sum += subject.finalGrade!.grade;
      }
    });

    return sum / count;
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

  // Gets all subjects passed.

  int getPassed() {
    int subjectsLeft = 0;

    subjects.forEach((Subject subject) {
      if (subject.passed) {
        subjectsLeft += 1;
      }
    });

    return subjectsLeft;
  }

  // Gets al subjects left for graduating.

  int getLeft() {
    int subjectsLeft = 0;

    subjects.forEach((Subject subject) {
      if (!subject.passed) {
        subjectsLeft += 1;
      }
    });

    return subjectsLeft;
  }

  // Gets the total of failings of the student.

  int getFailings() {
    int failings = 0;

    subjects.forEach((Subject subject) {
      failings += subject.failings.length;
    });

    return failings;
  }

  // Gets the total of reg subjects.
  int getSubjectsWithState(SubjectState state) {
    int value = 0;

    subjects.forEach((Subject subject) {
      if (subject.state != null) {
        if (subject.state! == state) {
          value++;
        }
      }
    });

    return value;
  }
}
