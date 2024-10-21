import 'package:afeco/app/ui/global_widgets/custom_address_pick.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_item.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/create_account_controller.dart';

class CreateAccountPage extends GetView<CreateAccountController> {
  const CreateAccountPage({super.key});
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
              'registerStoreTitle'.tr,
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            )),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Obx(() => SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        Label(title: 'registerStoreInformationStore'.tr),
                        CustomInput(
                          controller: controller.businessController.value,
                            label: 'yourBusinessName'.tr,
                            onValueChanged: (val) {},
                            hintText: 'yourBusinessName'.tr),
                        CustomSelectItem(
                            label: 'typeOfBusiness'.tr,
                            options: controller.typeBusiness.value,
                            defaultValue: controller.typeOfBusiness.value,
                            onChanged: (val) {
                              controller.typeOfBusiness.value = val;
                            }),
                        Label(title: 'businessAddress'.tr),
                        CustomAddressPick(label: 'address'.tr, onValueChanged: (val){
                          controller.address = val;
                          controller.streetController.value.text =val.displayName!;
                          controller.cityController.value.text =val.address!.city!;
                          controller.country.value =val.address!.countryCode!;
                          controller.postalCodeController.value.text =val.address!.postcode!;
                        }),
                        CustomInput(
                            controller: controller.streetController.value,
                            label: 'streetName'.tr,
                            onValueChanged: (val) {},
                            hintText: ''),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: CustomInput(
                                  controller: controller.postalCodeController.value,
                                  label: 'postalCode'.tr,
                                  onValueChanged: (val) {},
                                  hintText: ''),
                            ),
                            SizedBox(
                              width:  MediaQuery.sizeOf(context).width * 0.5,
                              child: CustomInput(
                                  controller: controller.cityController.value,
                                  label: 'city'.tr,
                                  onValueChanged: (val) {},
                                  hintText: ''),
                            ),
                          ],
                        ),

                        CustomSelectItem(
                            label: 'country'.tr,
                            options: controller.countries.value,
                            onChanged: (val) {}),
                        Label(title: 'contactInformation'.tr),
                        CustomInput(
                            controller: controller.phoneController.value,
                            label: 'phoneNumber'.tr,
                            onValueChanged: (val) {},
                            hintText: ''),
                        CustomInput(
                            controller: controller.emailController.value,
                            label: 'email'.tr,
                            onValueChanged: (val) {},
                            hintText: ''),
                        CustomButton(
                            onPressed: () {
                              controller.signLog();
                            },
                            text: 'continue'.tr,
                            backgroundColor: Constants.buttonColor)
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
