import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/landing_controller.dart';

class LandingPage extends GetView<LandingController> {
      const LandingPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('startSavingFood'.tr,style: TextStyle(fontWeight: FontWeight.w900,color: Constants.defaultHeaderColor, fontSize: 30.sp),)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/gifs/healthy-food.gif',width: MediaQuery.sizeOf(context).width*0.9,),
                  ],
                ),
                Column(
                  children: [
                    CustomButton(onPressed: (){
                      Get.toNamed(AppRoutes.INIT_PAGE);
                    }, text: 'continueWithGoogle'.tr, backgroundColor: Colors.blueAccent, icon: const FaIcon(FontAwesomeIcons.google,color: Colors.white,)),
                    SizedBox(height: 20.h,),
                    CustomButton(onPressed: (){
                      Get.toNamed(AppRoutes.SIGN_LOG);
                    }, text: 'continueWithEmail'.tr, backgroundColor: Constants.buttonColor,icon: const Icon(Icons.email,color: Colors.white,),),
                    SizedBox(height: 20.h,),
                    CustomButton(onPressed: (){
                      Get.toNamed(AppRoutes.STORE_LOGIN);
                    }, text: 'Continue as Store'.tr, backgroundColor: Constants.buttonColor,icon: const Icon(Icons.store,color: Colors.white,),),
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('gainsFromExcessFood'.tr, style: TextStyle(color: Colors.grey),),
                        TextButton(onPressed: (){
                          Get.toNamed(AppRoutes.CREATE_ACCOUNT);
                        }, child: Text('createStore'.tr, style: TextStyle(color: Constants.defaultHeaderColor, fontWeight: FontWeight.bold, fontSize: 15),))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
