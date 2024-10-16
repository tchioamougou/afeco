import 'package:afeco/app/data/services/language_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/header_custom.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_liststyle.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';
import 'package:app_settings/app_settings.dart';
import '../../../controllers/account_details_controller.dart';

class AccountDetailsPage extends GetView<AccountDetailsController> {
  const AccountDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Account Details'.tr,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 30,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.97,
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Constants.buttonColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "You're an hero",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          fontSize: 18.sp),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Center(
                                      child: Text(
                                        "tweaks than implement major changes to an existing app.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.FOOD_PLANNING);
                                        },
                                        child: const Text('Food Planning')),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'assets/image/save_food.png',
                                        height: 120,
                                        width: 120,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CustomListStile(
                    title: 'Profile',
                    icon: FontAwesomeIcons.user,
                    trailing:  FaIcon(FontAwesomeIcons.chevronRight, color: Constants.defaultHeaderColor,),
                    onPress: () {}),
                CustomListStile(
                    title: 'Notification',
                    icon: FontAwesomeIcons.bell,
                    trailing:  FaIcon(FontAwesomeIcons.chevronRight, color: Constants.defaultHeaderColor,),
                    onPress: () {
                      AppSettings.openAppSettings(type: AppSettingsType.notification);
                    }),
                CustomListStile(
                    title: 'Position',
                    icon: FontAwesomeIcons.mapLocation,
                    trailing:  FaIcon(FontAwesomeIcons.chevronRight, color: Constants.defaultHeaderColor,),
                    onPress: () {
                      AppSettings.openAppSettings(type: AppSettingsType.location);
                    }),
                CustomListStile(
                    title: 'Security',
                    icon: FontAwesomeIcons.key,
                    trailing:  FaIcon(FontAwesomeIcons.chevronRight, color: Constants.defaultHeaderColor,),
                    onPress: () {
                      AppSettings.openAppSettings(type: AppSettingsType.security);
                    }),
                CustomListStile(
                    title: 'Language',
                    icon: FontAwesomeIcons.globe,
                    trailing:  FaIcon(FontAwesomeIcons.chevronRight, color: Constants.defaultHeaderColor,),
                    subtitle: Text(LanguageService.instance.language.name.tr),
                    onPress: () {
                      Get.toNamed(AppRoutes.LANGUAGE);
                    }),
                CustomListStile(
                    title: 'Dark Mode',
                    icon: FontAwesomeIcons.eye,
                    trailing:  FaIcon(FontAwesomeIcons.toggleOff, color: Constants.defaultHeaderColor,),
                    onPress: () {}),
                CustomListStile(
                    title: 'Logout', icon: FontAwesomeIcons.close, onPress: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
