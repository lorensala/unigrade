import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unigrade/core/data.dart';
import 'package:unigrade/domain/entities/student.dart';
import 'package:unigrade/domain/entities/subject.dart';

class StudentController extends GetxController {
  // The reactive student atribute
  late Rx<Student> _student;

  // The average of all passed subjects without Failings.
  final RxDouble _avgNoFailing = RxDouble(0);

  // The average of all passed subjects with Failings.
  final RxDouble _avgFailing = RxDouble(0);

  // The total of subjects left for graduating.
  final RxInt _left = RxInt(0);

  // The total of failings of the student.
  final RxInt _failings = RxInt(0);

  // The total of subjects with "Promocion Practica" condition.
  final RxInt _promoP = RxInt(0);

  //The total of subjects with "Promocion Teorico" condition.
  final RxInt _promoT = RxInt(0);

  // The total of subjects with "Regular" condition.
  final RxInt _reg = RxInt(0);

  // The total of subjects passed.
  final RxInt _passed = RxInt(0);

  // The percentage of completition.
  final RxInt _completed = RxInt(0);

  // Gets the student.
  Student get student => _student.value;
  double get avgNoFailing => _avgNoFailing.value;
  double get avgFailing => _avgFailing.value;
  int get left => _left.value;
  int get passed => _passed.value;
  int get reg => _reg.value;
  int get promoT => _promoT.value;
  int get promoP => _promoP.value;
  int get failings => _failings.value;
  int get completed => _completed.value;

  // Sets the student.
  set student(Student student) => _student.value = student;
  set avgNoFailing(double value) => _avgNoFailing.value = value;
  set avgFailing(double value) => _avgFailing.value = value;
  set left(int value) => _left.value = value;
  set passed(int value) => _passed.value = value;
  set reg(int value) => _reg.value = value;
  set promoT(int value) => _promoT.value = value;
  set promoP(int value) => _promoP.value = value;
  set failings(int value) => _failings.value = value;
  set completed(int value) => _completed.value = value;

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

    avgNoFailing = student.getAvgNoFailings();
    avgFailing = student.getAvgFailings();
    left = student.getLeft();
    failings = student.getFailings();
    passed = student.getPassed();
    promoP = student.getSubjectsWithState(SubjectState.promocionPractica);
    promoT = student.getSubjectsWithState(SubjectState.promocionTeorica);
    reg = student.getSubjectsWithState(SubjectState.regular);
    completed = _getCompleted();

    super.onInit();
  }

  int _getCompleted() {
    return passed * 100 ~/ student.subjects.length;
  }
}
