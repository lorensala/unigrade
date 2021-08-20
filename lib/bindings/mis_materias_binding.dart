import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/mis_materias_page_controller.dart';

class MisMateriasBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MisMateriasPageController());
  }
}
