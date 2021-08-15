import 'package:get/get.dart';

class HomePageController extends GetxController {
  //late final RefreshController refreshController;
  //late final CoastController coastController;
  RxBool isLoading = true.obs;
  RxBool isRefreshing = false.obs;
  RxInt page = 0.obs;
  RxBool isPressedHome = true.obs;
  RxBool isPressedProfile = false.obs;
  RxBool isPressedSettings = false.obs;

  // Este controller controla la ui de el homepage.

  @override
  void onInit() {
    //refreshController = RefreshController();
    //coastController = CoastController();

    super.onInit();
  }
}
