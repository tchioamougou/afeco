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

class StoreInpactPage extends GetView<ProfileController> {
  const StoreInpactPage({super.key});
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
                  CustomCardImp(title: 'moneySaved'.tr, description: 'XAF 2000',icon: Icon(Icons.monetization_on, size: 50,color: Constants.buttonColor,),),
                  CustomCardImp(title: 'co2Saved'.tr, description: '20 IBS', icon: Icon(Icons.monetization_on, size: 50,color: Constants.buttonColor,))
                ],
              ),
              const SizedBox(height: 20,),
               CustomCardDefault(title: 'surpriseBagSaved'.tr, description: '0', imageUrl: 'imageUrl'),
              const SizedBox(height: 10,),
               CustomCardDefault(title: 'yourExcessFoodSaved'.tr, description: '0', imageUrl: 'imageUrl'),
              const SizedBox(height: 10,),
            ]),
          ),
        ),
      ),
    );
  }
}
