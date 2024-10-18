
import 'package:get/get.dart';
import '../controllers/donation_controller.dart';


class DonationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DonationController>(() => DonationController());
        // Get.put<DonationController>(DonationController());
  }
}