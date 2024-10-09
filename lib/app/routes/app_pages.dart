import '../bindings/onboarding_binding.dart';
import '../ui/pages/onboarding_page/onboarding_page.dart';
      import '../bindings/food_inventory_binding.dart';
import '../ui/pages/food_inventory_page/food_inventory_page.dart';
      import '../bindings/save_food_detail_binding.dart';
import '../ui/pages/save_food_detail_page/save_food_detail_page.dart';
      import '../bindings/notifications_binding.dart';
import '../ui/pages/notifications_page/notifications_page.dart';
      import '../bindings/food_plannig_binding.dart';
import '../ui/pages/food_plannig_page/food_planning_page.dart';
      import '../bindings/account_details_binding.dart';
import '../ui/pages/account_details_page/account_details_page.dart';
      import '../bindings/offers_binding.dart';
import '../ui/pages/offers_page/offers_page.dart';
      import '../bindings/profile_binding.dart';
import '../ui/pages/profile_page/profile_page.dart';
      import '../bindings/offer_details_binding.dart';
import '../ui/pages/offer_details_page/offer_details_page.dart';
      import '../bindings/find_around_binding.dart';
import '../ui/pages/find_around_page/find_around_page.dart';
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
      page: () => const MapPagePage(),
      binding: MapPageBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => const SearchPage(),
      binding: SearchBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.FIND_AROUND,
      page: () => const FindAroundPage(),
      binding: FindAroundBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.OFFER_DETAILS,
      page: () => const OfferDetailsPage(),
      binding: OfferDetailsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.OFFERS,
      page: () => const OffersPage(),
      binding: OffersBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ACCOUNT_DETAILS,
      page: () => const AccountDetailsPage(),
      binding: AccountDetailsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.FOOD_PLANNING,
      page: () => const FoodPlanningPage(),
      binding: FoodPlannigBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.NOTIFICATIONS,
      page: () => const NotificationsPage(),
      binding: NotificationsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SAVE_FOOD_DETAIL,
      page: () => const SaveFoodDetailPage(),
      binding: SaveFoodDetailBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.FOOD_INVENTORY,
      page: () => const FoodInventoryPage(),
      binding: FoodInventoryBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
      transition: _defaultTransition,
    ), 
];
}