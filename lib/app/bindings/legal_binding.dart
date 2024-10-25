
import 'package:get/get.dart';
import '../controllers/legal_controller.dart';


class LegalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LegalController>(() => LegalController());
        // Get.put<LegalController>(LegalController());
  }
}