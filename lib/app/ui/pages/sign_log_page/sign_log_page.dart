import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_checkbox.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/inputs/custom_input_country.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/sign_log_controller.dart';

class SignLogPage extends GetView<SignLogController> {
  const SignLogPage({super.key});
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
              'siglogTitle'.tr,
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            )),
        backgroundColor: Colors.white,
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInput(
                        controller: controller.emailController.value,
                        label: 'email'.tr,
                        hintText: 'email',
                        isRequired: true,
                        isEmail: true,
                        keyboardType: TextInputType.emailAddress,
                        onValueChanged: (String value) {},
                      ),
                      CustomInputCountry(label: 'country'.tr, isRequired: false,
                          initValue: controller.country.value,
                          onValueChanged: (val){
                        controller.country.value = val.code;
                      }),
                      CustomCheckbox(
                          label:
                          'allowEmailMessage'.tr,
                          onChanged: (val) {
                            controller.allow.value = val;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          onPressed: () {
                            controller.signLog();
                            //Get.toNamed(AppRoutes.EMAIL_CONFIRMATION);
                          },
                          text: 'continue'.tr,
                          disable: !controller.allow.value,
                          backgroundColor: Constants.buttonColor)
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

}
