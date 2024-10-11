
import 'package:get/get.dart';
import '../controllers/save_controller.dart';


class SaveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaveController>(() => SaveController());
        // Get.put<SaveController>(SaveController());
  }
}