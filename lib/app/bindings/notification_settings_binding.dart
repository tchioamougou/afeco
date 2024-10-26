
import 'package:get/get.dart';
import '../controllers/notification_settings_controller.dart';


class NotificationSettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationSettingsController>(() => NotificationSettingsController());
        // Get.put<NotificationSettingsController>(NotificationSettingsController());
  }
}