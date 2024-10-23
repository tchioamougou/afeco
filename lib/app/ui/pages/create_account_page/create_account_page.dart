import 'package:afeco/app/ui/global_widgets/custom_address_pick.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_checkbox.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_item.dart';
import 'package:afeco/app/ui/global_widgets/inputs/custom_input_password.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/global_widgets/position_display.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import '../../../data/models/option.dart';
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
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        if (controller.index.value == 0)
                          Column(
                            children: [
                              Label(title: 'registerStoreInformationStore'.tr),
                              CustomInput(
                                  controller:
                                      controller.businessController.value,
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
                              CustomAddressPick(
                                  label: 'address'.tr,
                                  defaultValue: controller.address,
                                  onValueChanged: (val) {
                                    controller.address = val;
                                    controller.streetController.value.text =
                                        val.displayName!;
                                    controller.cityController.value.text =
                                        val.address!.city!;
                                    /* controller.country.value =
                                        val.address!.countryCode!;*/
                                    controller.postalCodeController.value.text =
                                        val.address!.postcode!;
                                  }),
                              CustomInput(
                                  controller: controller.streetController.value,
                                  label: 'streetName'.tr,
                                  onValueChanged: (val) {},
                                  hintText: ''),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    child: CustomInput(
                                        controller: controller
                                            .postalCodeController.value,
                                        label: 'postalCode'.tr,
                                        onValueChanged: (val) {},
                                        hintText: ''),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    child: CustomInput(
                                        controller:
                                            controller.cityController.value,
                                        label: 'city'.tr,
                                        onValueChanged: (val) {},
                                        hintText: ''),
                                  ),
                                ],
                              ),
                              CustomSelectItem(
                                  label: 'country'.tr,
                                  options: controller.countries.value,
                                  defaultValue: controller.country.value,
                                  onChanged: (val) {
                                    controller.country.value = val;
                                  }),
                              Label(title: 'contactInformation'.tr),
                              CustomInput(
                                  controller: controller.phoneController.value,
                                  label: 'phoneNumber'.tr,
                                  onValueChanged: (val) {},
                                  keyboardType: TextInputType.number,
                                  hintText: ''),
                              CustomButton(
                                  onPressed: () {
                                    if (controller
                                        .verifyBusinessInformation()) {
                                      controller.index.value = 1;
                                    }
                                  },
                                  text: 'continue'.tr,
                                  backgroundColor: Constants.buttonColor)
                            ],
                          ),
                        if (controller.index.value == 1)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.index.value--;
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                              Text(
                                'createAccountStep2Title'.tr,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Constants.defaultBorderColor),
                              ),
                              Card(
                                color: Colors.white,
                                elevation: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      PositionDisplay(
                                          height: 120,
                                          pos: LatLng(
                                              double.parse(
                                                  controller.address.lat!),
                                              double.parse(
                                                  controller.address.lon!)),
                                          title: "here".tr),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(

                                            child: Text(
                                              controller
                                                  .businessController.value.text,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          Tag(
                                              content: controller
                                                  .typeOfBusiness.value,
                                              color: Colors.white60,
                                              backgroundColor:
                                                  Constants.buttonColor)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(controller.address.displayName!)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'createAccountStep2reason'.tr,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Constants.defaultBorderColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'createAccountStep2reasonExplication'.tr,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ...controller.raisonJoinedSaveFoodOptions
                                  .map((e) => checkBox(
                                        onChanged: (va) {
                                          if (va) {
                                            controller
                                                .raisonJoinedSaveFoods.value
                                                .add(e.value);
                                          } else {
                                            controller
                                                .raisonJoinedSaveFoods.value
                                                .remove(e.value);
                                          }
                                        },
                                        option: e,
                                        isChecked: controller
                                            .raisonJoinedSaveFoods
                                            .contains(e.value)
                                            .obs,
                                      )),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomButton(
                                  onPressed: () {
                                    print(
                                        controller.raisonJoinedSaveFoods.value);
                                    if (controller.raisonJoinedSaveFoods.value
                                        .isNotEmpty) {
                                      controller.index.value = 2;
                                    }
                                  },
                                  text: 'continue'.tr,
                                  // disable: controller.raisonJoinedSaveFoods.value.isEmpty,
                                  backgroundColor: Constants.buttonColor)
                            ],
                          ),
                        if (controller.index.value == 2)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.index.value--;
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                              Text(
                                'createAccountStep3Title'.tr,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Constants.defaultBorderColor),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Text(
                                    'createAccountStep3Description'.tr,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                    ),
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomInput(
                                  controller: controller.emailController.value,
                                  label: 'email'.tr,
                                  keyboardType: TextInputType.emailAddress,
                                  onValueChanged: (val) {},
                                  hintText: ''),
                              CustomInputPassword(
                                  controller:
                                      controller.passwordController.value,
                                  label: 'password'.tr,
                                  onValueChanged: (val) {},
                                  hintText: ''),
                              CustomInputPassword(
                                  controller: controller
                                      .confirmPasswordController.value,
                                  label: 'confirmPassword'.tr,
                                  onValueChanged: (val) {},
                                  hintText: ''),
                              CustomCheckbox(
                                  label: "allowStoreMessage".tr,
                                  onChanged: (val) {
                                    controller.allow.value = val;
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                  onPressed: () {
                                    if (controller.verifyConnectionInfo()) {
                                      controller.signLog();
                                    }
                                  },
                                  text: 'continue'.tr,
                                  backgroundColor: Constants.buttonColor)
                            ],
                          )
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

class checkBox extends StatelessWidget {
  final Function(bool) onChanged;
  final Option option;
  checkBox(
      {super.key,
      required this.onChanged,
      required this.option,
      required this.isChecked});
  final RxBool isChecked;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: isChecked.value ? Constants.defaultHeaderColor : null,
              border:
                  Border.all(width: 0.5, color: Constants.defaultHeaderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                activeColor: Constants.buttonColor,
                value: isChecked.value,
                onChanged: (value) {
                  isChecked.value = value ?? false;
                  onChanged(isChecked.value);
                },
              ),
              Expanded(
                  child: Text(
                option.label,
                style: TextStyle(
                  fontSize: 16,
                  color: isChecked.value ? Colors.white : null,
                ),
              )),
            ],
          ),
        ));
  }
}
