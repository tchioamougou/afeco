import 'package:afeco/app/ui/global_widgets/custom_address_pick.dart';
import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
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
  const CreateAccountPage({Key? key}) : super(key: key);
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
              'Register your store',
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
                        Label(title: 'Information about your business'),
                        CustomInput(
                          controller: controller.businessController.value,
                            label: 'Your business name',
                            onValueChanged: (val) {},
                            hintText: 'Your business name'),
                        CustomSelectItem(
                            label: 'Type of business',
                            options: controller.typeBusiness.value,
                            defaultValue: controller.typeOfBusiness.value,
                            onChanged: (val) {
                              controller.typeOfBusiness.value = val;
                            }),
                        Label(title: 'Business address'),
                        CustomAddressPick(label: 'Address', onValueChanged: (val){
                          controller.address = val;
                          controller.streetController.value.text =val.displayName!;
                          controller.cityController.value.text =val.address!.city!;
                          controller.country.value =val.address!.countryCode!;
                          controller.postalCodeController.value.text =val.address!.postcode!;
                        }),
                        CustomInput(
                            controller: controller.streetController.value,
                            label: 'Street name and number',
                            onValueChanged: (val) {},
                            hintText: ''),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: CustomInput(
                                  controller: controller.postalCodeController.value,
                                  label: 'Postal code',
                                  onValueChanged: (val) {},
                                  hintText: ''),
                            ),
                            SizedBox(
                              width:  MediaQuery.sizeOf(context).width * 0.5,
                              child: CustomInput(
                                  controller: controller.cityController.value,
                                  label: 'City',
                                  onValueChanged: (val) {},
                                  hintText: ''),
                            ),
                          ],
                        ),

                        CustomSelectItem(
                            label: 'Country',
                            options: controller.countries.value,
                            onChanged: (val) {}),
                        Label(title: 'Contact information'),
                        CustomInput(
                            controller: controller.phoneController.value,
                            label: 'Phone number',
                            onValueChanged: (val) {},
                            hintText: ''),
                        CustomInput(
                            controller: controller.emailController.value,
                            label: 'Email',
                            onValueChanged: (val) {},
                            hintText: ''),
                        CustomButton(
                            onPressed: () {
                              controller.signLog();
                            },
                            text: 'Save',
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
