import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/food_bank_model.dart';
import 'package:afeco/app/data/services/cinet_pay_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  RxBool loading = false.obs;
  RxDouble price = 1000.0.obs;
  RxList<FoodBankModel> foodBanks = <FoodBankModel>[].obs;
  final SaveFoodAppWriteController _appWriteController = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    getBank();
    super.onInit();
  }
  Future<void> donateNow() async {
    bool isError = await CinetPayService.handleCinetPayPayment(
        price.value.toInt(), 'Description');
    if (isError) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'paymentFailed'.tr,
          message: 'paymentFailedMessage'.tr,
          icon: const Icon(Icons.error),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    } else {
      Get.back();
    }
  }

  Future<void> getBank() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.foodBankCollection, []);
      foodBanks.value =
          dls.documents.map((e) => FoodBankModel.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
