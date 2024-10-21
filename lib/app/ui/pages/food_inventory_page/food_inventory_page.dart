import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_date_pick.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_item.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/pages/food_inventory_page/food_inventory_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/food_inventory_controller.dart';

class FoodInventoryPage extends GetView<FoodInventoryController> {
  const FoodInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.defaultHeaderColor,
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.circleArrowLeft,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          title: Text(
            'foodInventory'.tr,
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
          ),
          actions: [
            CustomButton(
                onPressed: () {
                  controller.makePlan();
                },
                text: 'updatePlanning'.tr,
                backgroundColor: Colors.deepOrange)
          ],
        ),
        body: Obx(() {
          return ListView.builder(
            itemCount: controller.foods.length,
            itemBuilder: (context, index) {
              final aliment = controller.foods[index];
              return FoodInventoryItem(
                  onDelete: () {},
                  foodModel: aliment,
                  image: 'assets/image/offer.png');
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialogueAddFood();
          },
          backgroundColor: Constants.buttonColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showDialogueAddFood() {
    Get.bottomSheet(
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Label(title: 'addNewFood'.tr),
                CustomInput(
                    controller: controller.foodNameController.value,
                    label: "name".tr,
                    onValueChanged: (val) {
                      controller.foodNameController.value.text = val;
                    },
                    hintText: 'name'.tr),
                CustomInput(
                    label: "quantity".tr,
                    controller: controller.quantityController.value,
                    onValueChanged: (val) {
                      controller.quantityController.value.text = val;
                    },
                    hintText: '0'),
                CustomSelectItem(
                    label: 'category'.tr,
                    options: controller.foodsCategories,
                    defaultValue: controller.category.value,
                    onChanged: (val) {
                      controller.category.value = val;
                    }),
                CustomDatePick(
                    label: 'expiredDate'.tr,
                    defaultValue: controller.expiredDate.value,
                    onValueChanged: (val) {
                      controller.expiredDate.value = val;
                    },
                    hintText: "10/12/2022"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        onPressed: () {
                          Get.back();
                        },
                        text: 'cancel'.tr,
                        backgroundColor: Colors.deepOrange),
                    CustomButton(
                        onPressed: () {
                          controller.addItem();
                        },
                        text: 'save'.tr,
                        backgroundColor: Constants.buttonColor)
                  ],
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        isDismissible: false);
  }
}
