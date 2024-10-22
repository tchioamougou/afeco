
import 'package:get/get.dart';
import '../controllers/store_login_controller.dart';


class StoreLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreLoginController>(() => StoreLoginController());
        // Get.put<StoreLoginController>(StoreLoginController());
  }
}