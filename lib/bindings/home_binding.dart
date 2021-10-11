import 'package:get/get.dart';
import 'package:unigrade/controllers/data/student_controller.dart';
import 'package:unigrade/controllers/presentation/home_page_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StudentController());
    Get.put(HomePageController());
  }
}
