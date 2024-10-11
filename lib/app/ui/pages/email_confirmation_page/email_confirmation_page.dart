import 'dart:ffi';

import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/email_confirmation_controller.dart';

class EmailConfirmationPage extends GetView<EmailConfirmationController> {
  const EmailConfirmationPage({super.key});
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
              'Control your email',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            )),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                        child: Column(
                          children: [
                            Image.asset('assets/image/img.png', height: 150,),
                            SizedBox(
                              height: 10,
                            ),
                            Text("We sent the email to ${controller.email.value}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18)),
                            Text(
                                "Please check your email for the verification link. Click on the link to proceed.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900)),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Alternatively, you can gig under the code contained in the email",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: CustomInput(
                                controller: controller.codeController.value,
                                label: '',
                                onValueChanged: (val) {},
                                hintText: '',
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: CustomButton(
                                backgroundColor: Constants.buttonColor,
                                onPressed: () {
                                  controller.validateEmail();
                                },
                                text: 'Verify',
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(height: 400,),

                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Haven't you received an email yet?"),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'Click here',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Constants.buttonColor),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}