import 'package:afeco/app/controllers/create_account_controller.dart';
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SmsVerificationController extends GetxController {
  Rx<TextEditingController> codeController = TextEditingController().obs;
  CreateAccountController _createAccountController = Get.find();
  SaveFoodAppWriteController _appWriteController = Get.find();
  RxString phone = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    phone.value = _createAccountController.phoneController.value.text;
    super.onInit();
  }

  Future<void> validatePhone() async {
    if (codeController.value.text.isNotEmpty) {
      await EasyLoading.show();
      try {
        //await _appWriteController.loginUser(codeController.value.text);
        await _createAccountController.submitForm();
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