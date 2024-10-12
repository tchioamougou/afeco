
import 'package:get/get.dart';
import '../controllers/store_profile_controller.dart';


class StoreProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreProfileController>(() => StoreProfileController());
        // Get.put<StoreProfileController>(StoreProfileController());
  }
}