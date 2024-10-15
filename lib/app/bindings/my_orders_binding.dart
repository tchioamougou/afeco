
import 'package:get/get.dart';
import '../controllers/my_orders_controller.dart';


class MyOrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyOrdersController>(() => MyOrdersController());
        // Get.put<MyOrdersController>(MyOrdersController());
  }
}