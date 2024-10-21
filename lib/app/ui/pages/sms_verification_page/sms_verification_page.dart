import 'package:afeco/app/controllers/sms_verification_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';


class SmsVerificationPage extends GetView<SmsVerificationController> {
  const SmsVerificationPage({super.key});
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
              'smsControlTitle'.tr,
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                        child: Column(
                          children: [
                            Image.asset('assets/image/img.png', height: 150,),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("${"weSentSms".tr} ${controller.phone.value}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18)),
                            Text(
                                "checkSmsMessage".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900)),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "smsAlternativeMessage".tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18),
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
                                  controller.validatePhone();
                                },
                                text: 'verify'.tr,
                              ),
                            )
                          ],
                        )),
                  ),
                  const SizedBox(height: 400,),

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
                      Text("notReceiveSms".tr),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'clickHere'.tr,
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
