import 'package:get/get.dart';
import 'package:unigrade/controllers/presentation/mis_notas_page_controller.dart';

class MisNotasBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MisNotasPageController());
  }
}
