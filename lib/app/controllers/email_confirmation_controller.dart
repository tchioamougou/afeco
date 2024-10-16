import 'package:afeco/app/controllers/sign_log_controller.dart';
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/user_model.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
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
        DocumentList dls = await _appWriteController
            .getDocuments(AppWriteCollection.bagsCollections, [
          Query.equal(
              "userId", [SessionService.instance.currentSession!.userId])
        ]);

        if (dls.total > 0) {
          UserService.instance.user = UserModel.fromJson(dls.documents[0].data);
        } else {
          UserModel um = UserModel(
              userId: SessionService.instance.currentSession!.userId,
              name: '',
              countryCode: SessionService.instance.currentSession!.countryCode,
              countryName: SessionService.instance.currentSession!.countryName,
              allow: true,
              email: _signLogController.emailController.value.text,
              acceptEmailAlert: false,
              acceptNotification: false,
              lat: 0.0,
              long: 0.0,
              documentId: "",
              bagsSaved: 0,
              carboneImpact: 0,
              excessFoodSaved: 0,
              moneySaved: 0);
          Document dc = await _appWriteController.createDocument(
              AppWriteCollection.userCollections, um.toJson());
          UserService.instance.user = UserModel.fromJson(dc.data);
          Get.toNamed(AppRoutes.SET_LOCATION);
        }
      } catch (e) {
        EasyLoading.showError("An Error Occur");
        print(e);
      } finally {
        EasyLoading.dismiss();
      }
    }
  }
}
