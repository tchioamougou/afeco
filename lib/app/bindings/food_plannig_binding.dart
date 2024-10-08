
import 'package:get/get.dart';
import '../controllers/food_plannig_controller.dart';


class FoodPlannigBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodPlannigController>(() => FoodPlannigController());
        // Get.put<FoodPlannigController>(FoodPlannigController());
  }
}