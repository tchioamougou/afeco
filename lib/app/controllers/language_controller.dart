
import 'dart:ui';

import 'package:afeco/app/data/models/lanquage_model.dart';
import 'package:afeco/app/data/services/language_service.dart';
import 'package:get/get.dart';
class LanguageController extends GetxController {
  Rx<LanguageModel> selectedLanguage = LanguageService.instance.language.obs;
  List<LanguageModel> languagesList =languages.obs;
  LanguageService languageService = LanguageService.instance;

  void changeLanguage(LanguageModel language) async{
    selectedLanguage.value = language;
    Locale locale = Locale(language.code);
    await Get.updateLocale(locale);
    languageService.language = language;
    Get.back();
  }
}