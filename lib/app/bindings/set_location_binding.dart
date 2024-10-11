
import 'package:get/get.dart';
import '../controllers/set_location_controller.dart';


class SetLocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetLocationController>(() => SetLocationController());
        // Get.put<SetLocationController>(SetLocationController());
  }
}