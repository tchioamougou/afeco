import 'dart:convert';

import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/option.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignLogController extends GetxController {
  RxInt stp = 0.obs;
  RxBool allow = false.obs;
  RxString country = "".obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  SaveFoodAppWriteController saveFoodAppWriteController = Get.find();
  RxList<Option> countries = <Option>[].obs;
  Future<List<Option>> readJsonData() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/country.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return Option.fromJsonList(jsonList);
  }

  @override
  void onInit() async {
    countries.value = await readJsonData();
    super.onInit();
  }

  Future<void> signLog() async {
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
