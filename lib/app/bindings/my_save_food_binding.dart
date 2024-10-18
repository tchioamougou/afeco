
import 'package:get/get.dart';
import '../controllers/my_save_food_controller.dart';


class MySaveFoodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySaveFoodController>(() => MySaveFoodController());
        // Get.put<MySaveFoodController>(MySaveFoodController());
  }
}