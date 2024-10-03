import '../bindings/search_binding.dart';
import '../ui/pages/search_page/search_page.dart';
      import '../bindings/map_page_binding.dart';
import '../ui/pages/map_page_page/map_page_page.dart';
      import '../bindings/tanking_binding.dart';
import '../ui/pages/tanking_page/tanking_page.dart';
      import '../bindings/save_food_form_binding.dart';
import '../ui/pages/save_food_form_page/save_food_form_page.dart';
      import '../bindings/landing_binding.dart';
import '../ui/pages/landing_page/landing_page.dart';
      import '../bindings/init_page_binding.dart';
import '../ui/pages/init_page_page/init_page_page.dart';
      import 'package:get/get.dart';


import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.INIT_PAGE,
      page: () =>  InitPagePage(),
      binding: InitPageBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.LANDING,
      page: () => const LandingPage(),
      binding: LandingBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SAVE_FOOD_FORM,
      page: () => const SaveFoodFormPage(),
      binding: SaveFoodFormBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.TANKING,
      page: () => const TankingPage(),
      binding: TankingBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.MAP_PAGE,
      page: () => const MapPage(),
      binding: MapPageBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => const SearchPage(),
      binding: SearchBinding(),
      transition: _defaultTransition,
    ), 
];
}