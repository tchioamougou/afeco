
import 'package:afeco/app/controllers/sign_log_controller.dart';
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
class EmailConfirmationController extends GetxController {
  Rx<TextEditingController> codeController = TextEditingController().obs;
  SignLogController _signLogController = Get.find();
  SaveFoodAppWriteController _appWriteController = Get.find();
  RxString email = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    email.value = _signLogController.emailController.value.text;
    super.onInit();
  }

  Future<void> validateEmail() async {
    if (codeController.value.text.isNotEmpty) {
      await EasyLoading.show();
      try {
        await _appWriteController.loginUser(codeController.value.text);
        await _appWriteController.createDocument(AppWriteCollection.userCollections,
        {
          "UserId":SessionService.instance.currentSession?.userId,
          "Name":"",
          "CountryCode":SessionService.instance.currentSession?.countryCode,
          "CountryName":SessionService.instance.currentSession?.countryName,
          "Allow":true,
          "Email":_signLogController.emailController.value.text
        });
        Get.toNamed(AppRoutes.SET_LOCATION);
      } catch (e) {
        EasyLoading.showError("An Error Occur");
        print(e);
      } finally {
        EasyLoading.dismiss();
      }
    }
  }
}