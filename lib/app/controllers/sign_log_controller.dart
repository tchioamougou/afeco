import 'dart:convert';

import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/option.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignLogController extends GetxController {
  RxInt stp = 0.obs;
  RxBool allow = false.obs;
  RxString country = "CM".obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  SaveFoodAppWriteController saveFoodAppWriteController = Get.find();
  final formKey = GlobalKey<FormState>();


  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> signLog() async {
    if(formKey.currentState!=null && formKey.currentState!.validate()){
      if (emailController.value.text.isNotEmpty && country.value.isNotEmpty && allow.value) {
        await EasyLoading.show();
        try {
          await saveFoodAppWriteController.createEmail(emailController.value.text);
          Get.toNamed(AppRoutes.EMAIL_CONFIRMATION);
        } catch (e) {
          // EasyLoading.showError("An Error Occur");
          print(e);
        } finally {
          EasyLoading.dismiss();
        }
      }
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
