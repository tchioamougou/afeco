
import 'package:get/get.dart';
import '../controllers/user_account_details_controller.dart';


class UserAccountDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAccountDetailsController>(() => UserAccountDetailsController());
        // Get.put<UserAccountDetailsController>(UserAccountDetailsController());
  }
}