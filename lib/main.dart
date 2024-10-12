
import 'package:afeco/app/controllers/store_home_controller.dart';
import 'package:afeco/app/controllers/store_profile_controller.dart';
import 'package:afeco/app/data/services/first_time_service.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_animation.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'app/data/services/dependency_injection.dart';
import 'app/data/services/theme_service.dart';
import 'app/data/services/translations_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/ui/layouts/main/main_layout.dart';
import 'app/ui/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInjection.init();
  runApp(const MyApp());
  configLoading();
}
void configLoading(){
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..backgroundColor = Constants.buttonColor
    ..progressColor = Colors.yellow
    ..indicatorColor = Colors.white
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
  ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool deviceFirstOpen = FirstTimeService.instance.isFirstTime;
    bool isLoggedIn = SessionService.instance.isLogged();

    String getInitialRoute() {

      if (deviceFirstOpen) {
        return AppRoutes.ONBOARDING;
      }else
       if (isLoggedIn) {
         if(SessionService.instance.isStore()){
           if(StoreService.instance.isStore()){
             Get.put<StoreHomeController>(StoreHomeController());
             Get.put<StoreProfileController>(StoreProfileController());
             return AppRoutes.STORE_INIT;
           }else{
             return AppRoutes.CREATE_ACCOUNT;
           }
         }
         return AppRoutes.INIT_PAGE;
      } else {
        return AppRoutes.LANDING;
      }
    }
   return ScreenUtilInit(
      builder: (_,__) {
        return GetMaterialApp(
          title: 'EcoBit',
          debugShowCheckedModeBanner: false,
         // theme: Themes().lightTheme,
          //darkTheme: Themes().darkTheme,
          themeMode: ThemeService.instance.themeMode,
          translations: Translation(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          initialRoute: getInitialRoute(),
          unknownRoute: AppPages.unknownRoutePage,
          getPages: AppPages.pages,
          builder: EasyLoading.init(),
        );
      },
     //! Must change it to true if you want to use the ScreenUtil
      designSize: const Size(411, 823),
    );
  }
}
