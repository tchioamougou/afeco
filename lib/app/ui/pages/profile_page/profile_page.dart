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
                  'Your Impact',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Constants.defaultHeaderColor,
                      fontSize: 30.sp),
                ),
              ),
              const SizedBox(height: 20,),
               Row(
                children: [
                  CustomCardImp(title: 'Money saved', description: 'XAF ${UserService.instance.user!.moneySaved}', imageUrl: ''),
                  CustomCardImp(title: 'CO2E saved', description: '${UserService.instance.user!.carboneImpact} IBS', imageUrl: '')
                ],
              ),
              const SizedBox(height: 20,),
               CustomCardDefault(title: 'Bags Saved', description: '${UserService.instance.user!.bagsSaved}', imageUrl: 'imageUrl'),
              const SizedBox(height: 10,),
               CustomCardDefault(title: 'Your Excess food saved', description: '${UserService.instance.user!.excessFoodSaved}', imageUrl: 'imageUrl'),
              const SizedBox(height: 10,),
              const Divider( height: 10,thickness: 2,color: Colors.grey,),
              const SizedBox(height: 10,),
              CustomListStile(title: 'Account Details', icon: FontAwesomeIcons.user, onPress: (){
                Get.toNamed(AppRoutes.ACCOUNT_DETAILS);
              }),
              CustomListStile(title: 'Actions History', icon: FontAwesomeIcons.history, onPress: (){}),
              CustomListStile(title: 'Help Centers', icon: FontAwesomeIcons.message, onPress: (){}),
              CustomListStile(title: 'Invite Friends', icon: FontAwesomeIcons.facebookF, onPress: (){}),
              CustomListStile(title: 'Privacy', icon: FontAwesomeIcons.keybase, onPress: (){})
            ]),
          ),
        ),
      ),
    );
  }
}
