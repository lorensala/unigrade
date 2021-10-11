import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unigrade/helpers/routes.dart';

/// SplashControllers is in charge of checking if the user is already logged in.

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
