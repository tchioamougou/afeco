
import 'package:get/get.dart';
import '../controllers/save_food_form_controller.dart';


class SaveFoodFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaveFoodFormController>(() => SaveFoodFormController());
        // Get.put<SaveFoodFormController>(SaveFoodFormController());
  }
}