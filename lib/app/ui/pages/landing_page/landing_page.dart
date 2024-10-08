import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/landing_controller.dart';

class LandingPage extends GetView<LandingController> {
      const LandingPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 35, 10, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Start saving food',style: TextStyle(fontWeight: FontWeight.w900,color: Constants.defaultHeaderColor, fontSize: 30.sp),)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/save_food.png',width: MediaQuery.sizeOf(context).width*0.9,),
                  ],
                ),
                Column(
                  children: [
                    CustomButton(onPressed: (){}, text: 'Continue with Google', backgroundColor: Colors.blueAccent, icon: const FaIcon(FontAwesomeIcons.google,color: Colors.white,)),
                    SizedBox(height: 20.h,),
                    CustomButton(onPressed: (){
                      Get.offAllNamed(AppRoutes.INIT_PAGE);
                    }, text: 'Continue with email', backgroundColor: Constants.buttonColor,icon: const Icon(Icons.email,color: Colors.white,),)
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
