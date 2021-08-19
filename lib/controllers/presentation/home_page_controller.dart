import 'package:get/get.dart';
import 'package:unigrade/controllers/services/sign_in_controller.dart';
import 'package:unigrade/services/sign_in/sign_in_google_service.dart';

class HomePageController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isRefreshing = false.obs;
  RxInt page = 0.obs;
  RxBool isPressedHome = true.obs;
  RxBool isPressedProfile = false.obs;
  RxBool isPressedSettings = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void signOut() {
    final SignInController signInController = Get.find<SignInController>();

    // TODO: How a im going to know what service do I have?
    signInController.signOut(GoogleSignInService());
  }
}
