
import 'package:get/get.dart';
import '../controllers/store_home_controller.dart';


class StoreHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreHomeController>(() => StoreHomeController());
        // Get.put<StoreHomeController>(StoreHomeController());
  }
}