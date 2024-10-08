import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/tanking_controller.dart';

class TankingPage extends GetView<TankingController> {
  const TankingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/food-africa.webp",
                  height: 200,
                  width: 300,
                ),
                Text(
                  'Thank you!',
                  style: GoogleFonts.sassyFrass(
                      fontSize: 60,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w900),
                ),
                Text('You Just Saved a meal From being wasted'.toUpperCase(),
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
                      'Celebrate with your friends and start saving meals togethers',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sansita(
                        fontSize: 17,
                        color: Constants.defaultHeaderColor,
                        fontWeight: FontWeight.w100,
                      )),
                ),
                Text('#ecobite',style: GoogleFonts.sansita(
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
      ),
    );
  }
}
