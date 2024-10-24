
import 'package:get/get.dart';
import '../controllers/donation_thanking_controller.dart';


class DonationThankingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DonationThankingController>(() => DonationThankingController());
        // Get.put<DonationThankingController>(DonationThankingController());
  }
}