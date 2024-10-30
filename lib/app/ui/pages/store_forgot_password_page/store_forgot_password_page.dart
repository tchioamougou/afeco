import 'package:afeco/app/controllers/store_forgot_password_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

class StoreForgotPasswordPage extends GetView<StoreForgotPasswordController> {
  const StoreForgotPasswordPage({super.key});
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
              'Forgot Password'.tr,
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
                    label: 'We will send you and email with a link to reset your password. Please enter the email associated with your account below'.tr,
                    hintText: 'email'.tr,
                    isEmail: true,
                    isRequired: true,
                    keyboardType: TextInputType.emailAddress,
                    onValueChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      onPressed: () {
                        controller.reset();
                      },
                      text: 'Reset password'.tr,
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
