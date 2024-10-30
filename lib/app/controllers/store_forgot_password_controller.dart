import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class StoreForgotPasswordController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  SaveFoodAppWriteController saveFoodAppWriteController = Get.find();
  final formKey = GlobalKey<FormState>();


  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> reset() async {
    if(formKey.currentState!=null && formKey.currentState!.validate()){
      if (emailController.value.text.isNotEmpty ) {
        await EasyLoading.show();
      }
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
