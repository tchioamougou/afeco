
import 'package:get/get.dart';
import '../controllers/offers_controller.dart';


class OffersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffersController>(() => OffersController());
        // Get.put<OffersController>(OffersController());
  }
}