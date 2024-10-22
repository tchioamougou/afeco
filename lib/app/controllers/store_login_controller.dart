import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/store_model.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class StoreLoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;

  SaveFoodAppWriteController _appWriteController = Get.find();

  Future<void> login() async {
    if (emailController.value.text.isNotEmpty &&
        passController.value.text.isNotEmpty) {
      EasyLoading.show();
      try {
        await _appWriteController.createEmailSession(
            emailController.value.text, passController.value.text);
        DocumentList dls = await _appWriteController
            .getDocuments(AppWriteCollection.storeCollections, [
          Query.equal(
              "userId", [SessionService.instance.currentSession!.userId])
        ]);
        if (dls.total > 0) {
          StoreService.instance.store =
              StoreModel.fromJson(dls.documents[0].data);
          Get.toNamed(AppRoutes.STORE_INIT);
        } else {}
      } catch (e) {
        ///
        print(e);
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.value.dispose();
    passController.value.dispose();
    super.dispose();
  }
}
