import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
