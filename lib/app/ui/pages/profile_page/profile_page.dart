import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_card_default.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_card_imp.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_liststyle.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(children: [
              const SizedBox(height: 20,),
              Center(
                child: Text(
                  'yourImpact'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Constants.defaultHeaderColor,
                      fontSize: 30.sp),
                ),
              ),
              const SizedBox(height: 20,),
               Row(
                children: [
                  CustomCardImp(title: 'moneySaved'.tr, description: 'XAF ${UserService.instance.user!.moneySaved}', imageUrl: ''),
                  CustomCardImp(title: 'co2Saved'.tr, description: '${UserService.instance.user!.carboneImpact} IBS', imageUrl: '')
                ],
              ),
              const SizedBox(height: 20,),
               CustomCardDefault(title: 'bagsSaved'.tr, description: '${UserService.instance.user!.bagsSaved}', imageUrl: 'imageUrl'),
              const SizedBox(height: 10,),
               CustomCardDefault(title: 'yourExcessFoodSaved'.tr, description: '${UserService.instance.user!.excessFoodSaved}', imageUrl: 'imageUrl'),
              const SizedBox(height: 10,),
              const Divider( height: 10,thickness: 2,color: Colors.grey,),
              const SizedBox(height: 10,),
              CustomListStile(title: 'accountDetails'.tr, icon: FontAwesomeIcons.user, onPress: (){
                Get.toNamed(AppRoutes.ACCOUNT_DETAILS);
              }),
              CustomListStile(title: 'Actions History'.tr, icon: FontAwesomeIcons.history, onPress: (){}),
              CustomListStile(title: 'helpsCenter'.tr, icon: FontAwesomeIcons.message, onPress: (){}),
              CustomListStile(title: 'inviteFriends'.tr, icon: FontAwesomeIcons.facebookF, onPress: (){}),
              CustomListStile(title: 'privacy'.tr, icon: FontAwesomeIcons.keybase, onPress: (){})
            ]),
          ),
        ),
      ),
    );
  }
}
