import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unigrade/helpers/routes.dart';

class SplashController extends GetxController {
  late final StreamSubscription<User?> authStream;
  @override
  void onInit() async {
    authStream =
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        print('Signed out');
        //TODO: Animate transitions.
        if (Get.currentRoute != Routes.LOGIN) Get.offAllNamed(Routes.LOGIN);
      } else {
        print('Already signed in');
        // Get data student.
        Get.offAllNamed(Routes.HOME);
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
