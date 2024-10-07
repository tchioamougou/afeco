
import 'package:get/get.dart';
import '../controllers/account_details_controller.dart';


class AccountDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountDetailsController>(() => AccountDetailsController());
        // Get.put<AccountDetailsController>(AccountDetailsController());
  }
}