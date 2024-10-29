import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_profile_header.dart';
import 'package:afeco/app/ui/global_widgets/custom_share_app.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_card_default.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_card_imp.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
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
          child: Column(
            children: [
              CustomProfileHeader(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(children: [
                  Center(
                    child: Text(
                      'yourImpact'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Constants.defaultHeaderColor,
                          fontSize: 30.sp),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomCardImp(
                          title: 'moneySaved'.tr,
                          description:
                              Constants.oCameroon.format(UserService.instance.user!.moneySaved),
                          icon: Icon(Icons.monetization_on, size: 50,color: Constants.buttonColor,),),
                      CustomCardImp(
                          title: 'co2Saved'.tr,
                          description:
                              '${UserService.instance.user!.carboneImpact} IBS',
                          icon: Icon(Icons.co2, size: 50,color: Constants.buttonColor,))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCardDefault(
                      title: 'bagsSaved'.tr,
                      description: '${UserService.instance.user!.bagsSaved}',
                      imageUrl: 'imageUrl'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCardDefault(
                      title: 'yourExcessFoodSaved'.tr,
                      description:
                          '${UserService.instance.user!.excessFoodSaved}',
                      imageUrl: 'imageUrl'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomShareApp()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
