import 'package:afeco/app/controllers/find_around_controller.dart';
import 'package:afeco/app/controllers/home_controller.dart';

import 'package:afeco/app/controllers/navigation_controller.dart';
import 'package:afeco/app/controllers/main_controller.dart';
import 'package:afeco/app/controllers/offers_controller.dart';
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/services/language_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:afeco/app/../firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
// firebase init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await dotenv.load();
    try {
      Stripe.publishableKey = Constants.stripePublicKey;
      await Stripe.instance.applySettings();
    }catch(e){
//
    }
    await GetStorage.init();
    await LanguageService.instance.initLanguage();
    //await logoutUser();
    Get.put<SaveFoodAppWriteController>(SaveFoodAppWriteController());
    Get.put<FindAroundController>(FindAroundController());
    Get.put<NavigationController>(NavigationController());
    Get.put<MainController>(MainController());
    Get.put<HomeController>(HomeController());
    Get.put<OffersController>(OffersController());
  }
}
