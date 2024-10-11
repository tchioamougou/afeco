
import 'package:get/get.dart';
import '../controllers/store_order_controller.dart';


class StoreOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreOrderController>(() => StoreOrderController());
        // Get.put<StoreOrderController>(StoreOrderController());
  }
}