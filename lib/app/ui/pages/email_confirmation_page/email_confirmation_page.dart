import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/email_confirmation_controller.dart';

class EmailConfirmationPage extends GetView<EmailConfirmationController> {
      const EmailConfirmationPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
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
                style: GoogleFonts.poppins(
                    fontSize: 20, color: Colors.white),
              )),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: FaIcon(FontAwesomeIcons.message,size: 150,color: Constants.buttonColor,),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}
