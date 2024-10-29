
import 'package:get/get.dart';
import '../controllers/store_detail_controller.dart';


class StoreDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreDetailController>(() => StoreDetailController());
        // Get.put<StoreDetailController>(StoreDetailController());
  }
}