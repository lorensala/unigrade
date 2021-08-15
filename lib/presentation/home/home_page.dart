import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/services/sign_in/sign_in_google_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.find<StudentController>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(studentController.student.fullname),
          Text(studentController.student.photoURL),
          Text(studentController.student.uid),
          GestureDetector(
              onTap: () {
                final SignInController signInController =
                    Get.put(SignInController());
                signInController.signOut(GoogleSignInService());
              },
              child: const Text('Sign out'))
        ],
      ),
    );
  }
}
