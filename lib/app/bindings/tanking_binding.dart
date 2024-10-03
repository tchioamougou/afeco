
import 'package:get/get.dart';
import '../controllers/tanking_controller.dart';


class TankingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TankingController>(() => TankingController());
        // Get.put<TankingController>(TankingController());
  }
}