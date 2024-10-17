import 'package:afeco/app/controllers/find_around_controller.dart';
import 'package:afeco/app/controllers/home_controller.dart';

import 'package:afeco/app/controllers/navigation_controller.dart';
import 'package:afeco/app/controllers/main_controller.dart';
import 'package:afeco/app/controllers/offers_controller.dart';
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/services/language_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:afeco/app/../firebase_options.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
// firebase init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await GetStorage.init();
    await LanguageService.instance.initLanguage();
    Get.put<FindAroundController>(FindAroundController());
    Get.put<NavigationController>(NavigationController());
    Get.put<MainController>(MainController());
    Get.put<SaveFoodAppWriteController>(SaveFoodAppWriteController());
    Get.put<HomeController>(HomeController());
    Get.put<OffersController>(OffersController());
  }
}
