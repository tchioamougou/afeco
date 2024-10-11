import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_checkbox.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/sign_log_controller.dart';

class SignLogPage extends GetView<SignLogController> {
      const SignLogPage ({super.key});
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
              'Sign up or Login',
              style: GoogleFonts.poppins(
                  fontSize: 20, color: Colors.white),
            )),
        backgroundColor: Colors.white,
        body:Obx(()=> SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 20,),
                CustomInput(
                    controller:controller.emailController.value,
                    label: 'Email', hintText: 'Your business name', onValueChanged: (String value) {  },),
                CustomSelectItem(label: 'Country', options: controller.countries, onChanged: (val){
                  controller.country.value = val;
                }, defaultValue: controller.country.value,),
                CustomCheckbox(label: 'I allow EcoBit to store my email address and name according to our privacy policy.', onChanged: (val){
                  controller.allow.value = val;
                }),
                SizedBox(height: 20,),
                CustomButton(
                    onPressed: () {
                      controller.signLog();
                      //Get.toNamed(AppRoutes.EMAIL_CONFIRMATION);
                    },
                    text: 'Continue',
                    disable: !controller.allow.value,
                    backgroundColor: Constants.buttonColor)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
