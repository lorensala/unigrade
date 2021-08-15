import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unigrade/domain/entities/student.dart';

class StudentController extends GetxController {
  late Rx<Student> _student;

  @override
  void onInit() {
    final User? _user = FirebaseAuth.instance.currentUser;

    if (_user != null) {
      _student = Student(
          fullname: _user.displayName ?? 'No name',
          uid: _user.uid,
          photoURL: _user.photoURL ?? '',
          subjects: []).obs;
    }

    super.onInit();
  }

  Student get student => _student.value;
  set student(Student student) => _student.value = student;
}
