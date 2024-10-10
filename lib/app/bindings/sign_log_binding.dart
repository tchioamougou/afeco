
import 'package:get/get.dart';
import '../controllers/sign_log_controller.dart';


class SignLogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignLogController>(() => SignLogController());
        // Get.put<SignLogController>(SignLogController());
  }
}