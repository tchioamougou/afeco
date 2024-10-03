
import 'package:get/get.dart';
import '../controllers/map_controller.dart';


class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapPageController>(() => MapPageController());
        // Get.put<MapController>(MapController());
  }
}