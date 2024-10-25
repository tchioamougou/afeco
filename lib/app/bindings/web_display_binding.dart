
import 'package:get/get.dart';
import '../controllers/web_display_controller.dart';


class WebDisplayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebDisplayController>(() => WebDisplayController());
        // Get.put<WebDisplayController>(WebDisplayController());
  }
}