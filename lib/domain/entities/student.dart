import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/grade.dart';

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
    int count = 0;
    int sum = 0;

    subjects.forEach((Subject subject) {
      if (subject.passed) {
        sum += subject.finalGrade!.grade;
        count++;
      }
    });

    if (count != 0) {
      return sum / count;
    } else {
      return 0;
    }
  }

  double getAvgWithFailings() {
    int count = 0;
    int sum = 0;

    subjects.forEach((Subject subject) {
      if (subject.passed) {
        sum += subject.finalGrade!.grade;
        count++;
      }
      if (subject.failings.isNotEmpty) {
        subject.failings.forEach((Grade grade) {
          sum += grade.grade;
          count++;
        });
      }
    });

    if (count != 0) {
      return sum / count;
    } else {
      return 0;
    }
  }

  // Gets all subjects passed.

  int getPassed() {
    int subjectsLeft = 0;

    subjects.forEach((Subject subject) {
      if (subject.passed) {
        subjectsLeft++;
      }
    });

    return subjectsLeft;
  }

  // Gets al subjects left for graduating.

  int getLeft() {
    int subjectsLeft = 0;

    subjects.forEach((Subject subject) {
      if (!subject.passed) {
        subjectsLeft++;
      }
    });

    return subjectsLeft;
  }

  int getCompleted() {
    return getPassed() * 100 ~/ subjects.length;
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

  Student copyWith({
    String? fullname,
    String? uid,
    String? photoURL,
    List<Subject>? subjects,
  }) {
    return Student(
        fullname: fullname ?? this.fullname,
        uid: uid ?? this.uid,
        photoURL: photoURL ?? this.photoURL,
        subjects: subjects ?? this.subjects);
  }

  Map<String, dynamic> toMap() {
    return {'fullname': fullname, 'photoURL': photoURL, 'id': uid};
  }
}
