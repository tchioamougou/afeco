
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
class InitPageController extends GetxController {
  RxInt currentIndex = 0.obs;
  selectedTab(index) {
    currentIndex.value = index;
  }
}