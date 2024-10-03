
import 'package:get/get.dart';
import '../controllers/init_page_controller.dart';


class InitPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitPageController>(() => InitPageController());
        // Get.put<InitPageController>(InitPageController());
  }
}