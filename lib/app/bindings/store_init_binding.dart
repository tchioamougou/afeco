
import 'package:get/get.dart';
import '../controllers/store_init_controller.dart';


class StoreInitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreInitController>(() => StoreInitController());
        // Get.put<StoreInitController>(StoreInitController());
  }
}