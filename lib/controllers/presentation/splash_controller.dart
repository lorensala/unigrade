import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/helpers/routes.dart';

class SplashController extends GetxController {
  late final StreamSubscription<User?> authStream;
  @override
  Future<void> onInit() async {
    authStream =
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        //TODO: Animate transitions.
        if (Get.currentRoute != Routes.LOGIN) Get.offAllNamed(Routes.LOGIN);
      } else {
        // Get data student.
        final StudentController studentController =
            Get.find<StudentController>();
        await studentController
            .loadUserData()
            .then((_) => Get.toNamed(Routes.HOME));
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    authStream.cancel();
    super.onClose();
  }
}
