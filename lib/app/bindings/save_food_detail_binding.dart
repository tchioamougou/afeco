
import 'package:get/get.dart';
import '../controllers/save_food_detail_controller.dart';


class SaveFoodDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaveFoodDetailController>(() => SaveFoodDetailController());
        // Get.put<SaveFoodDetailController>(SaveFoodDetailController());
  }
}