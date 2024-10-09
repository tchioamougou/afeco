import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_date_pick.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_item.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
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
            'Food inventory',
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
          ),
          actions: [
            CustomButton(
                onPressed: () {},
                text: 'Update planning',
                backgroundColor: Colors.deepOrange)
          ],
        ),
        body: Obx(() {
          return ListView.builder(
            itemCount: controller.foods.length,
            itemBuilder: (context, index) {
              final aliment = controller.foods[index];
              return ListTile(
                title: Text(aliment.name),
                subtitle: Text('Expire le : ${aliment.expirationDate}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.removeFood(index),
                ),
              );
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialogueAddFood();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Constants.buttonColor,
        ),
      ),
    );
  }

  void _showDialogueAddFood() {
    Get.bottomSheet(
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Label(title: 'Add New Food'),
                CustomInput(
                    label: "Name", onValueChanged: (val) {}, hintText: 'Text'),
                CustomInput(
                    label: "Quantity",
                    onValueChanged: (val) {},
                    hintText: 'Text'),
                CustomSelectItem(
                    label: 'Category', options: ['Friot'], onChanged: (va) {}),
                CustomDatePick(
                    label: 'Expired Date',
                    onValueChanged: (val) {},
                    hintText: "10/12/2022"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        onPressed: () {
                          Get.back();
                        },
                        text: 'Cancel',
                        backgroundColor: Colors.deepOrange),
                    CustomButton(
                        onPressed: () {
                          Get.back();
                        },
                        text: 'Save',
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
