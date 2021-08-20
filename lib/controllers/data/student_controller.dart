import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unigrade/domain/value/grade.dart';
import 'package:unigrade/domain/entities/student.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/professorship.dart';

class StudentController extends GetxController {
  late Rx<Student> _student;
  late double avgNoFailing;
  late double avgFailing;
  late int left;

  @override
  void onInit() {
    final User? _user = FirebaseAuth.instance.currentUser;

    // The user will never be null.
    if (_user != null) {
      _student = Student(
          fullname: _user.displayName ?? 'No name',
          uid: _user.uid,
          photoURL: _user.photoURL ?? '',
          subjects: <Subject>[
            Subject(
                id: '1',
                professorship: Professorship('2k1'),
                name: 'Sistemas Operativos',
                year: 2,
                gradesP: <Grade>[Grade(10), Grade(8), Grade(8)],
                gradesT: <Grade>[Grade(10), Grade(8), Grade(8)],
                gradesTP: <Grade>[Grade(10), Grade(8), Grade(8)],
                state: SubjectState.regular,
                icon: '',
                failings: <Grade>[Grade(2), Grade(2), Grade(2)],
                duration: SubjectDuration.anual,
                type: SubjectType.especializada,
                finalGrade: Grade(8)),
            Subject(
                id: '2',
                professorship: Professorship('2k1'),
                name: 'Análisis Matemático II',
                year: 2,
                gradesP: <Grade>[Grade(10), Grade(8), Grade(8)],
                gradesT: <Grade>[Grade(10), Grade(8), Grade(8)],
                gradesTP: <Grade>[Grade(10), Grade(8), Grade(8)],
                state: SubjectState.regular,
                icon: '',
                failings: <Grade>[Grade(2), Grade(2), Grade(2)],
                duration: SubjectDuration.anual,
                type: SubjectType.csbasica,
                finalGrade: Grade(8)),
          ]).obs;
    }

    avgNoFailing = student.getAvgFailings();
    avgFailing = student.getAvgFailings();
    left = student.getLeft();

    super.onInit();
  }

  Student get student => _student.value;
  set student(Student student) => _student.value = student;
}
