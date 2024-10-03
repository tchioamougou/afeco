
import 'package:get/get.dart';
import '../controllers/map_page_controller.dart';


class MapPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapPageController>(() => MapPageController());
        // Get.put<MapPageController>(MapPageController());
  }
}