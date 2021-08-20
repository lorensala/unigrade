import 'package:get/get.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/services/sign_in/sign_in_google_service.dart';

class HomePageController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isRefreshing = false.obs;
  RxInt page = 0.obs;
  final RxBool _isPressedHome = true.obs;
  final RxBool _isPressedSchool = false.obs;
  final RxBool _isPressedActivity = false.obs;

  bool get isPressedHome => _isPressedHome.value;
  bool get isPressedSchool => _isPressedSchool.value;
  bool get isPressedActivity => _isPressedActivity.value;

  set isPressedHome(bool value) => _isPressedHome.value = value;
  set isPressedSchool(bool value) => _isPressedSchool.value = value;
  set isPressedActivity(bool value) => _isPressedActivity.value = value;

  @override
  void onInit() {
    super.onInit();
  }

  void navigateHome() {
    isPressedHome = true;
    isPressedSchool = false;
    isPressedActivity = false;
  }

  void navigateSchool() {
    isPressedHome = false;
    isPressedSchool = true;
    isPressedActivity = false;
  }

  void navigateActivity() {
    isPressedHome = false;
    isPressedSchool = false;
    isPressedActivity = true;
  }

  void signOut() {
    final SignInController signInController = Get.find<SignInController>();

    // TODO: How a im going to know what service do I have?
    signInController.signOut(GoogleSignInService());
  }
}
