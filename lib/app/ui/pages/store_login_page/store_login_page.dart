import 'package:afeco/app/controllers/store_login_controller.dart';
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

class StoreLoginPage extends GetView<StoreLoginController> {
  const StoreLoginPage({super.key});
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
              'singingTitle'.tr,
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            )),
        backgroundColor: Colors.white,
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CustomInput(
                      controller: controller.emailController.value,
                      label: 'email'.tr,
                      hintText: 'email',
                      onValueChanged: (String value) {},
                    ),
                    CustomInput(
                      controller: controller.passController.value,
                      label: 'Password'.tr,
                      hintText: '',
                      keyboardType: TextInputType.visiblePassword,
                      onValueChanged: (String value) {},
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        onPressed: () {
                          controller.login();
                        },
                        text: 'Login'.tr,
                        backgroundColor: Constants.buttonColor)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
