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
                                ? 'Save'
                                : 'Continue',
                            backgroundColor: Constants.buttonColor),
                        TextButton(
                          onPressed: contController.onStepCancel,
                          child: Text('Back'),
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
            'General information',
            style: GoogleFonts.poppins(
                color: Constants.defaultHeaderColor,
                fontWeight: FontWeight.w900),
          ),
          content: Column(
            children: [
              CustomInput(
                  controller: controller.lastNameController,
                  isRequired: true,
                  label: "Name Package",
                  onValueChanged: (val) {},
                  hintText: 'Name'),
              CustomInput(
                isRequired: true,
                controller: controller.phoneController,
                label: "Phone",
                onValueChanged: (val) {},
                hintText: 'Phone',
                helper:
                    'This information will be used to get more details about your giving package',
              ),
              CustomAddressPick(
                label: 'Address',
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
            'Information on food to be given',
            style: GoogleFonts.poppins(
                color: Constants.defaultHeaderColor,
                fontWeight: FontWeight.w900),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Package Picture",
                style:
                    GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
              ),
              if(controller.packageFile.value.isNotEmpty)
                Image.file(File(controller.packageFile.value)),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                  onPressed: () {
                    controller.openGallery();
                  },
                  text: 'Take Picture',
                  backgroundColor: Constants.buttonColor),
              Text(
                "Detailed product list",
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
                                  title: 'Add New Product',
                                ),
                                CustomInput(
                                    controller:
                                        controller.typeAlimentController,
                                    label: "Food",
                                    onValueChanged: (val) {},
                                    hintText: 'Food'),
                                CustomInput(
                                  controller: controller.quantityController,
                                  label: "Quantity",
                                  onValueChanged: (val) {},
                                  hintText: 'Quantity',
                                  helper:
                                      'Estimated total quantity (by weight or volume)',
                                ),
                                CustomDatePick(
                                    label: 'Expiry date',
                                    onValueChanged: (val) {
                                      controller.expirationDate = val;
                                    },
                                    hintText: 'Expiry date'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        text: 'Cancel',
                                        backgroundColor: Colors.deepOrange),
                                    CustomButton(
                                        onPressed: () {
                                          controller.addProduct();
                                        },
                                        text: 'Save',
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
                  text: 'Add food',
                  backgroundColor: Constants.defaultHeaderColor),
              SizedBox(
                height: 15.h,
              ),
              CustomSelectItem(
                  label: 'Type of packaging',
                  options: controller.typePackaging,
                  defaultValue: controller.typePackagingSelect.value,
                  onChanged: (val) {
                    controller.typePackagingSelect.value = val;
                  }),
              CustomSelectItem(
                  label: 'Packaging condition',
                  options: controller.packagingConditions,
                  defaultValue: controller.packagingCondition.value,
                  onChanged: (va) {
                    controller.packagingCondition.value = va;
                  }),
              CustomInput(
                controller: controller.reasonController,
                label: 'Reason for giving',
                onValueChanged: (va) {},
                hintText: 'e.g. excessive purchases, diet changes, etc.',
                helper: 'Why do you want to give these foods?',
                maxLines: 3,
              )
            ],
          )),
      Step(
          isActive: controller.currentStep >= 2,
          title: Text(
            'Additional information',
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
                hintText: 'Select value',
                help: "Allergens in food",
              ),
              CustomSelectItem(
                label: 'Restrictions',
                options: controller.restrictions,
                defaultValue: controller.restriction.value,
                onChanged: (va) {
                  controller.restriction.value = va;
                },
                hintText: 'Select value',
                help: "Do foodstuffs require special storage?",
              ),
              //TODO Photos: Possibilité de joindre des photos des aliments pour une meilleure évaluation de leur état
            ],
          )),
      Step(
        isActive: controller.currentStep >= 3,
        title: Text(
          'Recovery mode',
          style: GoogleFonts.poppins(
              color: Constants.defaultHeaderColor, fontWeight: FontWeight.w900),
        ),
        content: Column(
          children: [
            CustomSelectItem(
              label: 'Preferred recovery modes',
              options: controller.preferredRecoveryModes,
              defaultValue: controller.preferredRecoveryMode.value,
              onChanged: (va) {
                controller.preferredRecoveryMode.value = va;
              },
            ),
            CustomDatePick(
                label: "Select availability date",
                defaultValue: controller.availableDate,
                onValueChanged: (val) {
                  controller.availableDate = val;
                },
                hintText: '20/10/2022'),
            Row(
              children: [
                Expanded(
                  child: CustomTime(
                      label: 'Between',
                      onValueChanged: (val) {
                        controller.betweenDate = val;
                      },
                      hintText: '09:00 PM'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomTime(
                      label: 'And',
                      onValueChanged: (val) {
                        controller.betweenDate = val;
                      },
                      hintText: '09:00 PM'),
                ),
              ],
            ),
            CustomSelectItem(
                label: 'Sharing with neighbors',
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
