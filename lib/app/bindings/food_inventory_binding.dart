
import 'package:get/get.dart';
import '../controllers/food_inventory_controller.dart';


class FoodInventoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodInventoryController>(() => FoodInventoryController());
        // Get.put<FoodInventoryController>(FoodInventoryController());
  }
}