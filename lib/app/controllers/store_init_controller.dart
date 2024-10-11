
import 'package:get/get.dart';
class StoreInitController extends GetxController {
  RxInt currentIndex = 0.obs;
  selectedTab(index) {
    currentIndex.value = index;
  }
}