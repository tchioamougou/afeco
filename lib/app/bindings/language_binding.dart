
import 'package:get/get.dart';
import '../controllers/language_controller.dart';


class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
        // Get.put<LanguageController>(LanguageController());
  }
}