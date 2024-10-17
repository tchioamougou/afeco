import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/language_controller.dart';

class LanguagePage extends GetView<LanguageController> {
  const LanguagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Scaffold(
            appBar: CustomAppBar(
              title: 'Language'.tr,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: controller.languagesList.map((language) {
                  return ListTile(
                    title: Text(language.name.tr),
                    trailing: Obx(() =>
                        controller.selectedLanguage.value.code == language.code
                            ? Icon(
                                Icons.check_circle,
                                color: Constants.buttonColor,
                              )
                            : const SizedBox.shrink()),
                    onTap: () {
                      controller.changeLanguage(language);
                    },
                  );
                }).toList(),
              ),
            )));
  }
}
