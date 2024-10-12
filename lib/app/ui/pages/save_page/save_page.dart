import 'package:afeco/app/controllers/save_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_address_pick.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_date_pick.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_item.dart';
import 'package:afeco/app/ui/global_widgets/custom_time.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/pages/save_food_form_page/product_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/save_food_form_controller.dart';

class SavePage extends GetView<SaveController> {
  const SavePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Stack(
        children: [
          Obx(() => Scaffold(
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
                    'Save food',
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  )),
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Label(title: 'New surprise bag for your customer'),
                    CustomInput(
                        label: 'Original Price',
                        onValueChanged: (va) {},
                        hintText: '',
                        controller: controller.originalPriceController.value,
                        keyboardType: TextInputType.number),
                    CustomInput(
                        label: 'New Price',
                        onValueChanged: (va) {},
                        hintText: '',
                        controller: controller.newPriceController.value,
                        keyboardType: TextInputType.number),
                    CustomInput(
                        label: 'Number of Bag',
                        onValueChanged: (va) {},
                        hintText: '',
                        controller: controller.quantityPriceController.value,
                        keyboardType: TextInputType.number),
                    CustomDatePick(
                        label: 'PickUp Date',
                        defaultValue: controller.pickupDate.value,
                        onValueChanged: (val) {
                          controller.pickupDate.value = val;
                        },
                        hintText: ''),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: CustomTime(
                              label: 'From',
                              onValueChanged: (val) {
                                controller.pickupDateFrom.value = val;
                              },
                              hintText: ''),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: CustomTime(
                              label: 'to',
                              onValueChanged: (val) {
                                controller.pickupDateTo.value = val;
                              },
                              hintText: ''),
                        ),
                      ],
                    ),
                    CustomButton(
                        onPressed: () {
                          controller.addNewSurprise();
                        },
                        text: 'Save',
                        backgroundColor: Constants.buttonColor)
                  ],
                ),
              ))),
        ],
      ),
    );
  }
}