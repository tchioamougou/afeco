
import 'package:get/get.dart';
import '../controllers/delete_account_controller.dart';


class DeleteAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteAccountController>(() => DeleteAccountController());
        // Get.put<DeleteAccountController>(DeleteAccountController());
  }
}