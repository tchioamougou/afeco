import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/tanking_controller.dart';

class DonationThankingPage extends GetView<TankingController> {
  const DonationThankingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.INIT_PAGE);
              },
              icon:  FaIcon(FontAwesomeIcons.x,color: Constants.buttonColor,),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/image/gifs/charity.gif",
                height: 300,
                width: 300,
              ),
              Text('thankYouTitleDonation'.tr.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sansita(
                    fontSize: 25,
                    color: Constants.defaultHeaderColor,
                    fontWeight: FontWeight.w900,
                  )),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Text(
                    'thankYouShareMessage'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sansita(
                      fontSize: 17,
                      color: Constants.defaultHeaderColor,
                      fontWeight: FontWeight.w100,
                    )),
              ),
              Text('#SaveFood',style: GoogleFonts.sansita(
                fontSize: 17,
                color: Constants.defaultHeaderColor,
                fontWeight: FontWeight.w100,
              )),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.facebook,color: Constants.buttonColor,),
                  const SizedBox(width: 20,),
                  FaIcon(FontAwesomeIcons.telegram,color: Constants.buttonColor,),
                  const SizedBox(width: 20,),
                  FaIcon(FontAwesomeIcons.whatsapp,color: Constants.buttonColor,),
                  const SizedBox(width: 20,),
                  FaIcon(FontAwesomeIcons.snapchat,color: Constants.buttonColor,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
