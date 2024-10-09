
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class OnboardingController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: pageIndex.value);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}