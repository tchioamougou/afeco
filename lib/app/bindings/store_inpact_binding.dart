
import 'package:get/get.dart';
import '../controllers/store_inpact_controller.dart';


class StoreInpactBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreInpactController>(() => StoreInpactController());
        // Get.put<StoreInpactController>(StoreInpactController());
  }
}