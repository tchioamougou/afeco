
import 'package:get/get.dart';
import '../controllers/find_around_controller.dart';


class FindAroundBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindAroundController>(() => FindAroundController());
        // Get.put<FindAroundController>(FindAroundController());
  }
}