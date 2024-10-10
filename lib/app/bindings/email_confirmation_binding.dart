
import 'package:get/get.dart';
import '../controllers/email_confirmation_controller.dart';


class EmailConfirmationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailConfirmationController>(() => EmailConfirmationController());
        // Get.put<EmailConfirmationController>(EmailConfirmationController());
  }
}