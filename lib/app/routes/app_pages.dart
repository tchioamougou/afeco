import '../bindings/store_forgot_password_binding.dart';
import '../ui/pages/store_forgot_password_page/store_forgot_password_page.dart';
      import '../bindings/store_detail_binding.dart';
import '../ui/pages/store_detail_page/store_detail_page.dart';
      import 'package:afeco/app/ui/pages/account_details_page/how_it_works.dart';
import 'package:afeco/app/ui/pages/account_details_page/how_it_works_show.dart';

import '../bindings/notification_settings_binding.dart';
import '../ui/pages/notification_settings_page/notification_settings_page.dart';
      import '../bindings/web_display_binding.dart';
import '../ui/pages/web_display_page/web_display_page.dart';
      import '../bindings/legal_binding.dart';
import '../ui/pages/legal_page/legal_page.dart';
      import '../bindings/delete_account_binding.dart';
import '../ui/pages/delete_account_page/delete_account_page.dart';
      import '../bindings/user_account_details_binding.dart';
import '../ui/pages/user_account_details_page/user_account_details_page.dart';
      import '../bindings/donation_thanking_binding.dart';
import '../ui/pages/donation_thanking_page/donation_thanking_page.dart';
      import '../bindings/store_login_binding.dart';
import '../ui/pages/store_login_page/store_login_page.dart';
      import '../bindings/donation_binding.dart';
import '../ui/pages/donation_page/donation_page.dart';
      import '../bindings/my_save_food_binding.dart';
import '../ui/pages/my_save_food_page/my_save_food_page.dart';
      import '../bindings/language_binding.dart';
import '../ui/pages/language_page/language_page.dart';
      import '../bindings/my_orders_binding.dart';
import '../ui/pages/my_orders_page/my_orders_page.dart';
      import '../bindings/store_inpact_binding.dart';
import '../ui/pages/store_inpact_page/store_inpact_page.dart';
      import '../bindings/store_profile_binding.dart';
import '../ui/pages/store_profile_page/store_profile_page.dart';
      import '../bindings/save_binding.dart';
import '../ui/pages/save_page/save_page.dart';
      import '../bindings/store_order_binding.dart';
import '../ui/pages/store_order_page/store_order_page.dart';
      import '../bindings/store_home_binding.dart';
import '../ui/pages/store_home_page/store_home_page.dart';
      import '../bindings/store_init_binding.dart';
import '../ui/pages/store_init_page/store_init_page.dart';
      import '../bindings/sms_verification_binding.dart';
import '../ui/pages/sms_verification_page/sms_verification_page.dart';
      import '../bindings/set_location_binding.dart';
import '../ui/pages/set_location_page/set_location_page.dart';
      import '../bindings/email_confirmation_binding.dart';
import '../ui/pages/email_confirmation_page/email_confirmation_page.dart';
      import '../bindings/sign_log_binding.dart';
import '../ui/pages/sign_log_page/sign_log_page.dart';
      import '../bindings/create_account_binding.dart';
import '../ui/pages/create_account_page/create_account_page.dart';
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
    GetPage(
      name: AppRoutes.CREATE_ACCOUNT,
      page: () => const CreateAccountPage(),
      binding: CreateAccountBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SIGN_LOG,
      page: () => const SignLogPage(),
      binding: SignLogBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.EMAIL_CONFIRMATION,
      page: () => const EmailConfirmationPage(),
      binding: EmailConfirmationBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SET_LOCATION,
      page: () => const SetLocationPage(),
      binding: SetLocationBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SMS_VERIFICATION,
      page: () => const SmsVerificationPage(),
      binding: SmsVerificationBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.STORE_INIT,
      page: () =>  StoreInitPage(),
      binding: StoreInitBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.STORE_HOME,
      page: () => const StoreHomePage(),
      binding: StoreHomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.STORE_ORDER,
      page: () => const StoreOrderPage(),
      binding: StoreOrderBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SAVE,
      page: () => const SavePage(),
      binding: SaveBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.STORE_PROFILE,
      page: () => const StoreProfilePage(),
      binding: StoreProfileBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.STORE_INPACT,
      page: () => const StoreInpactPage(),
      binding: StoreInpactBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.MY_ORDERS,
      page: () => const MyOrdersPage(),
      binding: MyOrdersBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.LANGUAGE,
      page: () => const LanguagePage(),
      binding: LanguageBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.MY_SAVE_FOOD,
      page: () => const MySaveFoodPage(),
      binding: MySaveFoodBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.DONATION,
      page: () => const DonationPage(),
      binding: DonationBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.STORE_LOGIN,
      page: () => const StoreLoginPage(),
      binding: StoreLoginBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.DONATION_THANKING,
      page: () => const DonationThankingPage(),
      binding: DonationThankingBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.USER_ACCOUNT_DETAILS,
      page: () => const UserAccountDetailsPage(),
      binding: UserAccountDetailsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.DELETE_ACCOUNT,
      page: () => const DeleteAccountPage(),
      binding: DeleteAccountBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.LEGAL,
      page: () => const LegalPage(),
      binding: LegalBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.WEB_DISPLAY,
      page: () => const WebDisplayPage(),
      binding: WebDisplayBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION_SETTINGS,
      page: () =>  NotificationSettingsPage(),
      binding: NotificationSettingsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.HOW_IT_WORKS_SETTINGS,
      page: () =>  HowItWorks(),
      binding: AccountDetailsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.HOW_IT_WORKS_SHOW_SETTINGS,
      page: () =>  HowItWorksShow(),
      binding: AccountDetailsBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.STORE_DETAIL,
      page: () => const StoreDetailPage(),
      binding: StoreDetailBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.STORE_FORGOT_PASSWORD,
      page: () => const StoreForgotPasswordPage(),
      binding: StoreForgotPasswordBinding(),
      transition: _defaultTransition,
    ), 
];
}