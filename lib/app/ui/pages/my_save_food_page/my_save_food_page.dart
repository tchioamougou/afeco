import 'package:afeco/app/controllers/my_save_food_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_save_food_neighbourdhood_item.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/global_widgets/no_elements/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class MySaveFoodPage extends GetView<MySaveFoodController> {
  const MySaveFoodPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'myBags'.tr,
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  if (controller.bags.isNotEmpty)
                    Column(
                      children: [
                        Label(title: 'myReservedBack'.tr),
                        Column(
                          children: controller.bags
                              .map((e) =>
                                  CustomSaveFoodNeighbourdhoodItem(gp: e,width: 0.95,))
                              .toList(),
                        ),
                      ],
                    ),
                  if (controller.givingBags.isNotEmpty)
                    Column(
                      children: [
                        Label(title: 'myGivingBack'.tr),
                        Column(
                          children: controller.givingBags
                              .map((e) =>
                                  CustomSaveFoodNeighbourdhoodItem(gp: e,width: 0.95,))
                              .toList(),
                        ),
                      ],
                    ),
                  if (controller.bags.isEmpty && controller.givingBags.isEmpty)
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      child: CustomAlert(
                          image: 'assets/image/angry.png',
                          title:
                              'nothingShareWithNei'.tr,
                          actionLabel: "saveFood".tr,
                          onPress: () {}),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
