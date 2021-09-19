import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unigrade/core/data.dart';
import 'package:unigrade/domain/value/grade.dart';
import 'package:unigrade/domain/entities/student.dart';
import 'package:unigrade/domain/entities/subject.dart';
import 'package:unigrade/domain/value/professorship.dart';

class StudentController extends GetxController {
  // The reactive student atribute
  late Rx<Student> _student;

  // The average of all passed subjects without Failings.
  RxDouble avgNoFailing = RxDouble(0);

  // The average of all passed subjects with Failings.
  RxDouble avgFailing = RxDouble(0);

  // The total of subjects left for graduating.
  RxInt left = RxInt(0);

  // The total of failings of the student.
  RxInt failings = RxInt(0);

  // The total of subjects with "Promocion Practica" condition.
  RxInt promoP = RxInt(0);

  //The total of subjects with "Promocion Teorico" condition.
  RxInt promoT = RxInt(0);

  // The total of subjects with "Regular" condition.
  RxInt reg = RxInt(0);

  // The total of subjects passed.
  RxInt passed = RxInt(0);

  // Gets the student.
  Student get student => _student.value;

  // Sets the student.
  set student(Student student) => _student.value = student;

  @override
  void onInit() {
    // instance of the current user logged in.
    final User? _user = FirebaseAuth.instance.currentUser;

    if (_user != null) {
      _student = Student(
              fullname: _user.displayName ?? 'No name',
              uid: _user.uid,
              photoURL: _user.photoURL ?? '',
              subjects: allSubjects)
          .obs;
    }

    avgNoFailing.value = student.getAvgNoFailings();
    avgFailing.value = student.getAvgFailings();
    left.value = student.getLeft();
    failings.value = student.getFailings();
    passed.value = student.getPassed();
    promoP.value = student.getSubjectsWithState(SubjectState.promocionPractica);
    promoT.value = student.getSubjectsWithState(SubjectState.promocionTeorica);
    reg.value = student.getSubjectsWithState(SubjectState.regular);

    super.onInit();
  }
}
