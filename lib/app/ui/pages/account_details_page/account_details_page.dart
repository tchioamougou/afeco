import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/services/language_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_liststyle.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';
import 'package:app_settings/app_settings.dart';
import '../../../controllers/account_details_controller.dart';

class AccountDetailsPage extends GetView<AccountDetailsController> {
  const AccountDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'accountDetails'.tr,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomListStile(
                    title: 'Profile'.tr,
                    icon: FontAwesomeIcons.user,
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Constants.defaultHeaderColor,
                    ),
                    onPress: () {}),
                CustomListStile(
                    title: 'language'.tr,
                    icon: FontAwesomeIcons.globe,
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Constants.defaultHeaderColor,
                    ),
                    subtitle: Text(LanguageService.instance.language.name.tr),
                    onPress: () {
                      Get.toNamed(AppRoutes.LANGUAGE);
                    }),
                CustomListStile(
                    title: 'notification'.tr,
                    icon: FontAwesomeIcons.bell,
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Constants.defaultHeaderColor,
                    ),
                    onPress: () {
                      AppSettings.openAppSettings(
                          type: AppSettingsType.notification);
                    }),
                CustomListStile(
                    title: 'position'.tr,
                    icon: FontAwesomeIcons.mapLocation,
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Constants.defaultHeaderColor,
                    ),
                    onPress: () {
                      AppSettings.openAppSettings(
                          type: AppSettingsType.location);
                    }),
                CustomListStile(
                    title: 'security'.tr,
                    icon: FontAwesomeIcons.key,
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: Constants.defaultHeaderColor,
                    ),
                    onPress: () {
                      AppSettings.openAppSettings(
                          type: AppSettingsType.security);
                    }),
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
                                      "inviteFriendTitle".tr,
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
                                        "inviteFriendMessage".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          bool shared =
                                              await controller.inviteFriend();
                                          if (shared) {
                                            Get.snackbar('youAreHero'.tr,
                                                'togetherAgainst'.tr);
                                          }
                                        },
                                        child: Text('inviteFriends'.tr)),
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
                    title: 'darkMode'.tr,
                    icon: FontAwesomeIcons.eye,
                    trailing: FaIcon(
                      FontAwesomeIcons.toggleOff,
                      color: Constants.defaultHeaderColor,
                    ),
                    onPress: () {}),
                CustomListStile(
                    title: 'Actions History'.tr,
                    icon: FontAwesomeIcons.history,
                    onPress: () {}),
                CustomListStile(
                    title: 'helpsCenter'.tr,
                    icon: FontAwesomeIcons.message,
                    onPress: () {}),
                CustomListStile(
                    title: 'privacy'.tr,
                    icon: FontAwesomeIcons.keybase,
                    onPress: () {}),
                CustomListStile(
                    title: 'Logout'.tr,
                    icon: FontAwesomeIcons.close,
                    onPress: () async {
                      try {
                        EasyLoading.show();
                        await logoutUser();
                        EasyLoading.dismiss();
                        Get.offAllNamed(AppRoutes.LANDING);
                      } catch (e) {
                        EasyLoading.dismiss();
                      }
                    }),
                CustomListStile(
                    title: 'deleteAccount'.tr,
                    icon: FontAwesomeIcons.deleteLeft,
                    onPress: () async {
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
