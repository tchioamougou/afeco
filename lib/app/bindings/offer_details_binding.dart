
import 'package:get/get.dart';
import '../controllers/offer_details_controller.dart';


class OfferDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferDetailsController>(() => OfferDetailsController());
        // Get.put<OfferDetailsController>(OfferDetailsController());
  }
}