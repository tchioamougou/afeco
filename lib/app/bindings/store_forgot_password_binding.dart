
import 'package:get/get.dart';
import '../controllers/store_forgot_password_controller.dart';


class StoreForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreForgotPasswordController>(() => StoreForgotPasswordController());
        // Get.put<StoreForgotPasswordController>(StoreForgotPasswordController());
  }
}