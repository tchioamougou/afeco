import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderCustom extends StatelessWidget {
  const HeaderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300),
            border: Border.all(color: Constants.defaultBorderColor,width: 1)
          ),
          child:ClipRRect(
            child: Image.asset(
              'assets/image/planet.png',
            ),
            borderRadius: BorderRadius.circular(300),
          ) ,
        )
        ,
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hi!,Styves'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins-light',
                        color: Constants.defaultHeaderColor),
                  ),
                ],
              ),
              Container(
                width: 200.w,
                child: Text(
                  'Let save food today',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Constants.defaultHeaderColor,
                      fontFamily: 'poppins-light'),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Stack(
                children: [
                  IconButton.outlined(
                    onPressed: () {
                      Get.toNamed(AppRoutes.NOTIFICATIONS);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.bell,
                      color: Colors.white,
                      size: 25,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Constants.defaultBorderColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 15)),
                  ),
                  Positioned(
                      top: 2,
                      right: 10,
                      child: Text('20',style: GoogleFonts.poppins(fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
