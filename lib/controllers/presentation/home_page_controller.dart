import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/presentation/widgets/custom_waiting_dialog.dart';
import 'package:unigrade/services/sign_in/sign_in_google_service.dart';

class HomePageController extends GetxController {
  RxInt page = 0.obs;
  final RxBool _isPressedHome = true.obs;
  final RxBool _isPressedSchool = false.obs;
  final RxBool _isPressedActivity = false.obs;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  bool get isPressedHome => _isPressedHome.value;
  bool get isPressedSchool => _isPressedSchool.value;
  bool get isPressedActivity => _isPressedActivity.value;

  set isLoading(bool value) {
    _isLoading.value = value;
    if (value) {
      Get.dialog(const CustomWaitingDialog());
    } else {
      Get.back();
    }
  }

  set isPressedHome(bool value) => _isPressedHome.value = value;
  set isPressedSchool(bool value) => _isPressedSchool.value = value;
  set isPressedActivity(bool value) => _isPressedActivity.value = value;

  @override
  Future<void> onReady() async {
    isLoading = true;
    await Get.find<StudentController>().loadUserData();
    isLoading = false;
    super.onReady();
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
    Get.find<SignInController>().signOut(GoogleSignInService());
  }
}
