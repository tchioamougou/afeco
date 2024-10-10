import 'package:afeco/app/routes/app_routes.dart';
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
      const SignLogPage ({Key? key}) : super(key: key);
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 20,),
                CustomInput(label: 'Email', onValueChanged: (val){}, hintText: 'Your business name'),
                CustomSelectItem(label: 'Country', options: [], onChanged: (val){}),
                CustomCheckbox(label: 'I allow EcoBit to store my email address and name according to our privacy policy.', onChanged: (ba){}),
                SizedBox(height: 20,),
                CustomButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.EMAIL_CONFIRMATION);
                    },
                    text: 'Continue',
                    backgroundColor: Constants.buttonColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
