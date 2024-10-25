import 'package:afeco/app/controllers/legal_controller.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class LegalPage extends GetView<LegalController> {
  const LegalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'legal'.tr,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  dense: true,
                  title: Text("termsAndConditions".tr),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Get.toNamed(AppRoutes.WEB_DISPLAY,arguments: ['termsAndConditions'.tr,'https://savefoodweb.vercel.app/']);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("privacyPolicy".tr),
                  trailing: Icon(Icons.chevron_right),
                  onTap: (){
                    Get.toNamed(AppRoutes.WEB_DISPLAY,arguments: ['privacyPolicy'.tr,'https://savefoodweb.vercel.app/']);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("doNotShareOrSellData".tr),
                  trailing: Icon(Icons.chevron_right),
                  onTap: (){
                    Get.toNamed(AppRoutes.WEB_DISPLAY,arguments: ['doNotShareOrSellData'.tr.tr,'https://savefoodweb.vercel.app/']);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
