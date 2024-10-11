
import 'package:get/get.dart';
import '../controllers/sms_verification_controller.dart';


class SmsVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmsVerificationController>(() => SmsVerificationController());
        // Get.put<SmsVerificationController>(SmsVerificationController());
  }
}