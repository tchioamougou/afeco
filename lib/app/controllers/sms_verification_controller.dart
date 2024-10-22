import 'package:afeco/app/controllers/create_account_controller.dart';
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

class SmsVerificationController extends GetxController {
  Rx<TextEditingController> codeController = TextEditingController().obs;
  final CreateAccountController _createAccountController = Get.find();
  final SaveFoodAppWriteController _appWriteController = Get.find();
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
        await _appWriteController.loginUser(codeController.value.text);
        DocumentList dls = await _appWriteController
            .getDocuments(AppWriteCollection.storeCollections, [
          Query.equal("userId", [SessionService.instance.currentSession!.userId])
        ]);
        if(dls.total >0){
          StoreService.instance.store = StoreModel.fromJson(dls.documents[0].data);
        }else{
        }
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