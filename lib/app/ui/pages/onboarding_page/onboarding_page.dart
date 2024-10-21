import 'package:afeco/app/data/services/first_time_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                          itemCount: demoData.length,
                          controller: controller.pageController,
                          onPageChanged: (index) {
                            controller.pageIndex.value = index;
                          },
                          itemBuilder: (context, index) => OnBoardingContent(
                                image: demoData[index].image,
                                title: demoData[index].title,
                                description: demoData[index].description,
                              ))),
                  Row(
                    children: [
                      ...List.generate(
                          demoData.length,
                          (index) => DotIndicator(
                                isActive: index == controller.pageIndex.value,
                              )),
                      const Spacer(),
                      if (controller.pageIndex.value == demoData.length - 1)
                        ElevatedButton(
                            onPressed: () {
                              FirstTimeService.instance.isFirstTime = false;
                              Get.offAllNamed(AppRoutes.LANDING);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Constants.buttonColor),
                            child: Text(
                              'gotIt'.tr,
                              style: const TextStyle(color: Colors.white),
                            ))
                      else
                        SizedBox(
                          height: 70.h,
                          width: 70.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (controller.pageIndex.value ==
                                      demoData.length - 1) {
                                    Get.offAllNamed(AppRoutes.LANDING);
                                  } else {
                                    controller.pageController.nextPage(
                                        duration:
                                            const Duration(microseconds: 300),
                                        curve: Curves.ease);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor: Constants.buttonColor),
                                child: Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.white,
                                  size: 19.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ))),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String image, title, description;

  const OnBoardingContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 200,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: Constants.defaultHeaderColor,
              fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey),
        ),
        const Spacer(),
      ],
    );
  }
}

class OnBoard {
  final String image, title, description;
  OnBoard(
      {required this.image, required this.title, required this.description});
}

final List<OnBoard> demoData = [
  OnBoard(
      image: 'assets/image/img.png',
      title: 'onBoard1_title'.tr,
      description: 'onBoard1_description'.tr),
  OnBoard(
      image: 'assets/image/img.png',
      title: 'onBoard2_title'.tr,
      description: 'onBoard2_description'.tr),
  OnBoard(
      image: 'assets/image/img.png',
      title: 'onBoard3_title'.tr,
      description: 'onBoard3_description'.tr),
  OnBoard(
      image: 'assets/image/img.png',
      title: 'onBoard4_title'.tr,
      description: 'onBoard4_description'.tr),
];

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive
              ? Constants.buttonColor
              : Constants.buttonColor.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
