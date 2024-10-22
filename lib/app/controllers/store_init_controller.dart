
import 'package:afeco/app/controllers/store_home_controller.dart';
import 'package:afeco/app/controllers/store_order_controller.dart';
import 'package:afeco/app/controllers/store_profile_controller.dart';
import 'package:get/get.dart';
class StoreInitController extends GetxController {
  RxInt currentIndex = 0.obs;
  selectedTab(index) {
    currentIndex.value = index;
  }
  @override
  void onInit() async{
    // TODO: implement onInit
    Get.put(StoreHomeController());
    Get.lazyPut(()=>StoreProfileController());
    Get.lazyPut(()=>StoreOrderController());
    super.onInit();
  }
}