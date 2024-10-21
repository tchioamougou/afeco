import 'package:afeco/app/controllers/save_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_date_pick.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_time.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';
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
                    Label(title: 'newSurpriseBagForCustomer'.tr),
                    CustomInput(
                        label: 'originalPrice'.tr,
                        onValueChanged: (va) {},
                        hintText: '',
                        controller: controller.originalPriceController.value,
                        keyboardType: TextInputType.number),
                    CustomInput(
                        label: 'newPrice'.tr,
                        onValueChanged: (va) {},
                        hintText: '',
                        controller: controller.newPriceController.value,
                        keyboardType: TextInputType.number),
                    CustomInput(
                        label: 'numberOfBag'.tr,
                        onValueChanged: (va) {},
                        hintText: '',
                        controller: controller.quantityPriceController.value,
                        keyboardType: TextInputType.number),
                    CustomDatePick(
                        label: 'pickUpDate'.tr,
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
                              label: 'from'.tr,
                              onValueChanged: (val) {
                                controller.pickupDateFrom.value = val;
                              },
                              hintText: ''),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: CustomTime(
                              label: 'to'.tr,
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
                        text: 'save'.tr,
                        backgroundColor: Constants.buttonColor)
                  ],
                ),
              ))),
        ],
      ),
    );
  }
}
