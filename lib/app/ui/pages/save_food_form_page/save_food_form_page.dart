import 'dart:io';

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

class SaveFoodFormPage extends GetView<SaveFoodFormController> {
  const SaveFoodFormPage({super.key});
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
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.white),
                    )),
                backgroundColor: Colors.white,
                body: Stepper(
                  controlsBuilder: (context, contController) {
                    return Row(
                      children: <Widget>[
                        CustomButton(
                            onPressed: contController.currentStep == 3
                                ? () async {
                                    await controller.submitForm();
                                  }
                                : contController.onStepContinue!,
                            text: contController.currentStep == 3
                                ? 'save'.tr
                                : 'continue'.tr,
                            backgroundColor: Constants.buttonColor),
                        TextButton(
                          onPressed: contController.onStepCancel,
                          child: Text('back'.tr),
                        ),
                      ],
                    );
                  },
                  type: StepperType.vertical,
                  currentStep: controller.currentStep.value,
                  steps: getSteps(context),
                  onStepTapped: (step) => controller.currentStep.value = step,
                  onStepContinue: controller.nextStep,
                  onStepCancel: controller.previousStep,
                ),
              )),
        ],
      ),
    );
  }

  List<Step> getSteps(context) {
    return [
      Step(
          isActive: controller.currentStep >= 0,
          title: Text(
            'generaleInformation'.tr,
            style: GoogleFonts.poppins(
                color: Constants.defaultHeaderColor,
                fontWeight: FontWeight.w900),
          ),
          content: Column(
            children: [
              CustomInput(
                  controller: controller.lastNameController,
                  isRequired: true,
                  label: "packageName".tr,
                  onValueChanged: (val) {},
                  hintText: 'name'.tr),
              CustomInput(
                isRequired: true,
                controller: controller.phoneController,
                label: "phoneNumber".tr,
                onValueChanged: (val) {},
                hintText: 'phoneNumber'.tr,
                helper: 'saveFoodPhoneDescription'.tr,
              ),
              CustomAddressPick(
                label: 'address'.tr,
                onValueChanged: (val) {
                  controller.address = val;
                },
                isRequired: true,
              )
            ],
          )),
      Step(
          isActive: controller.currentStep >= 1,
          title: Text(
            'saveFoodInformationAboutGiving'.tr,
            style: GoogleFonts.poppins(
                color: Constants.defaultHeaderColor,
                fontWeight: FontWeight.w900),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "packagePicture".tr,
                style:
                    GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
              ),
              if (controller.packageFile.value.isNotEmpty)
                Image.file(File(controller.packageFile.value)),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                  onPressed: () {
                    controller.openGallery();
                  },
                  text: 'takePicture'.tr,
                  backgroundColor: Constants.buttonColor),
              Text(
                "productDetailsList".tr,
                style:
                    GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: controller.products.value
                    .map((e) => ProductItem(
                          foodModel: e,
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 10.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                  width: 70,
                                  child: Divider(
                                    height: 20,
                                    thickness: 5,
                                    color: Constants.defaultHeaderColor,
                                  ),
                                ),
                                Label(
                                  title: 'addNewFood'.tr,
                                ),
                                CustomInput(
                                    controller:
                                        controller.typeAlimentController,
                                    label: "food".tr,
                                    onValueChanged: (val) {},
                                    hintText: 'food'.tr),
                                CustomInput(
                                  controller: controller.quantityController,
                                  label: "quantity".tr,
                                  onValueChanged: (val) {},
                                  hintText: 'quantity'.tr,
                                  helper: 'quantityEstimation'.tr,
                                ),
                                CustomDatePick(
                                    label: 'expiredDate'.tr,
                                    onValueChanged: (val) {
                                      controller.expirationDate = val;
                                    },
                                    hintText: 'expiredDate'.tr),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        text: 'cancel'.tr,
                                        backgroundColor: Colors.deepOrange),
                                    CustomButton(
                                        onPressed: () {
                                          controller.addProduct();
                                        },
                                        text: 'save'.tr,
                                        backgroundColor: Constants.buttonColor)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  text: 'addFood'.tr,
                  backgroundColor: Constants.defaultHeaderColor),
              SizedBox(
                height: 15.h,
              ),
              CustomSelectItem(
                  label: 'typeOfPackaging'.tr,
                  options: controller.typePackaging,
                  defaultValue: controller.typePackagingSelect.value,
                  onChanged: (val) {
                    controller.typePackagingSelect.value = val;
                  }),
              CustomSelectItem(
                  label: 'packagingCondition'.tr,
                  options: controller.packagingConditions,
                  defaultValue: controller.packagingCondition.value,
                  onChanged: (va) {
                    controller.packagingCondition.value = va;
                  }),
              CustomInput(
                controller: controller.reasonController,
                label: 'reasonForGiving',
                onValueChanged: (va) {},
                hintText: 'reasonForGivingHint'.tr,
                helper: 'reasonForGivingHelper'.tr,
                maxLines: 3,
              )
            ],
          )),
      Step(
          isActive: controller.currentStep >= 2,
          title: Text(
            'additionalInformation'.tr,
            style: GoogleFonts.poppins(
                color: Constants.defaultHeaderColor,
                fontWeight: FontWeight.w900),
          ),
          content: Column(
            children: [
              CustomSelectItem(
                label: 'Allergens',
                options: controller.allergens,
                defaultValue: controller.allergen.value,
                onChanged: (va) {
                  controller.allergen.value = va;
                },
                help: "allergensInFood".tr,
              ),
              CustomSelectItem(
                label: 'restrictions'.tr,
                options: controller.restrictions,
                defaultValue: controller.restriction.value,
                onChanged: (va) {
                  controller.restriction.value = va;
                },
                help: "restrictionsHelper".tr,
              ),
            ],
          )),
      Step(
        isActive: controller.currentStep >= 3,
        title: Text(
          'recoveryMode'.tr,
          style: GoogleFonts.poppins(
              color: Constants.defaultHeaderColor, fontWeight: FontWeight.w900),
        ),
        content: Column(
          children: [
            CustomSelectItem(
              label: 'preferredRecoveryMode'.tr,
              options: controller.preferredRecoveryModes,
              defaultValue: controller.preferredRecoveryMode.value,
              onChanged: (va) {
                controller.preferredRecoveryMode.value = va;
              },
            ),
            CustomDatePick(
                label: "selectAvailabilityDate".tr,
                defaultValue: controller.availableDate,
                onValueChanged: (val) {
                  controller.availableDate = val;
                },
                hintText: '20/10/2022'),
            Row(
              children: [
                Expanded(
                  child: CustomTime(
                      label: 'between'.tr,
                      onValueChanged: (val) {
                        controller.betweenDate = val;
                      },
                      hintText: '09:00 PM'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTime(
                      label: 'and'.tr,
                      onValueChanged: (val) {
                        controller.betweenDate = val;
                      },
                      hintText: '09:00 PM'),
                ),
              ],
            ),
            CustomSelectItem(
                label: 'sharingWith'.tr,
                options: controller.shareWiths,
                defaultValue: controller.shareWith.value,
                onChanged: (va) {
                  controller.shareWith.value = va;
                }),
          ],
        ),
      ),
    ];
  }
}
