import 'package:afeco/app/controllers/user_account_details_controller.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/pages/user_account_details_page/change_country.dart';
import 'package:afeco/app/ui/pages/user_account_details_page/change_email.dart';
import 'package:afeco/app/ui/pages/user_account_details_page/change_name.dart';
import 'package:afeco/app/ui/pages/user_account_details_page/change_phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class UserAccountDetailsPage extends GetView<UserAccountDetailsController> {
  const UserAccountDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'accountDetails'.tr,
        ),
        backgroundColor: Colors.white,
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('personalInformation'.tr.toUpperCase()),
                      ],
                    ),
                    ListTile(
                      onTap: () async {
                        await Get.to(const ChangeNamePage());
                        controller.refreshUser();
                      },
                      title: Text("name".tr),
                      subtitle: Text(controller.us.value.name.isNotEmpty
                          ? controller.us.value.name
                          : 'optional'.tr),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 17,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(const ChangeEmailPage());
                      },
                      title: Text("email".tr),
                      subtitle: Text(controller.us.value.email),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 17,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        await Get.to(const ChangePhonePage());
                        controller.refreshUser();
                      },
                      title: Text("phoneNumber".tr),
                      subtitle: Text(controller.us.value.phoneNumber??''),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 17,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        await Get.to(const ChangeCountryPage());
                        controller.refreshUser();
                      },
                      title: Text("country".tr),
                      subtitle: Text(controller.us.value.countryName),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 17,
                      ),
                    ),
/*                ListTile(
                  dense: true,
                  title: Text("birthday".tr),
                  subtitle: Text(controller.us.email),
                ),
                ListTile(
                  dense: true,
                  title: Text("Gender".tr),
                  subtitle: Text(controller.us.email),
                ),*/
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.DELETE_ACCOUNT);
                      },
                      dense: true,
                      leading: const Icon(
                        Icons.delete_rounded,
                        size: 17,
                        color: Colors.red,
                      ),
                      title: Text(
                        "deleteAccount".tr,
                        style: const TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 17,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
