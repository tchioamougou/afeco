import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/services/language_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/confirmation_dialogue.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_liststyle.dart';
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
          title: 'manageAccount'.tr,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('Settings'.toUpperCase()),
                CustomListStile(
                    title: 'accountDetails'.tr,
                    icon: FontAwesomeIcons.user,
                    trailing: Icons.chevron_right,
                    onPress: () {
                      Get.toNamed(AppRoutes.USER_ACCOUNT_DETAILS);
                    }),
                CustomListStile(
                    title: 'language'.tr,
                    icon: FontAwesomeIcons.globe,
                    subtitle: Text(LanguageService.instance.language.name.tr),
                    onPress: () {
                      Get.toNamed(AppRoutes.LANGUAGE);
                    }),
                CustomListStile(
                    title: 'notification'.tr,
                    icon: FontAwesomeIcons.bell,
                    trailing: Icons.chevron_right,
                    onPress: () {
                    Get.toNamed(AppRoutes.NOTIFICATION_SETTINGS);
                    }),
                CustomListStile(
                    title: 'position'.tr,
                    icon: FontAwesomeIcons.mapLocation,
                    trailing: Icons.chevron_right,
                    onPress: () {
                      AppSettings.openAppSettings(
                          type: AppSettingsType.location);
                    }),
                CustomListStile(
                    title: 'darkMode'.tr,
                    icon: FontAwesomeIcons.eye,
                    trailing: Icons.chevron_right,
                    onPress: () {}),
                const SizedBox(
                  height: 30,
                ),
                Text('Support'.toUpperCase()),
                CustomListStile(
                    title: 'helpWithOrder'.tr,
                    icon: Icons.shopping_bag_outlined,
                    trailing: Icons.chevron_right,
                    onPress: () {}),
                CustomListStile(
                    title: 'howSaveFoodWorks'.tr,
                    icon: Icons.help_outline_outlined,
                    trailing: Icons.chevron_right,
                    onPress: () {
                      Get.toNamed(AppRoutes.HOW_IT_WORKS_SETTINGS);
                    }),
                CustomListStile(
                    title: 'joinUs'.tr,
                    icon: Icons.person_add_alt_outlined,
                    trailing: Icons.chevron_right,
                    onPress: () {}),
                const SizedBox(
                  height: 30,
                ),
                Text('others'.toUpperCase()),
                CustomListStile(
                    title: 'Blog'.tr,
                    icon: Icons.library_books_outlined,
                    trailing: Icons.chevron_right,
                    onPress: () async {
                      Get.toNamed(AppRoutes.WEB_DISPLAY, arguments: [
                        'Blog',
                        'https://savefoodweb.vercel.app/'
                      ]);
                    }),
                CustomListStile(
                    title: 'legal'.tr,
                    icon: Icons.handyman,
                    trailing: Icons.chevron_right,
                    onPress: () {
                      Get.toNamed(AppRoutes.LEGAL);
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    onPressed: () async {
                      Get.dialog(
                        ConfirmationDialog(
                          title: 'logout'.tr,
                          message: 'proceedMessage'.tr,
                          onConfirm: () async {
// Perform action on confirmation
                            try {
                              EasyLoading.show();
                              await logoutUser();
                              EasyLoading.dismiss();
                              Get.offAllNamed(AppRoutes.LANDING);
                            } catch (e) {
                              EasyLoading.dismiss();
                            }
                          },
                          onCancel: () {
// Perform action on cancellation
                            Get.back();
                          },
                        ),
                      );
                    },
                    text: 'logout'.tr,
                    backgroundColor: Colors.red)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
