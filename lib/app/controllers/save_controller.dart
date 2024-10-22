import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SaveController extends GetxController {
  final SaveFoodAppWriteController _appWriteController = Get.find();

  Rx<TextEditingController> originalPriceController =
      TextEditingController().obs;
  Rx<TextEditingController> newPriceController = TextEditingController().obs;
  Rx<TextEditingController> quantityPriceController =
      TextEditingController().obs;
  Rx<DateTime> pickupDate = DateTime.now().obs;
  Rx<TimeOfDay> pickupDateFrom = TimeOfDay.now().obs;
  Rx<TimeOfDay> pickupDateTo = TimeOfDay.now().obs;

  // Méthode pour soumettre le formulaire
  Future<void> addNewSurprise() async {
    await EasyLoading.show();
    try {
      Bag gp = Bag(
        name: 'Surprise Bags',
        originalPrice: double.parse(originalPriceController.value.text),
        price: double.parse(newPriceController.value.text),
        quantity: int.parse(quantityPriceController.value.text),
        pickupDateStart:
            Utils.setDateTime(pickupDate.value, pickupDateFrom.value),
        pickupDateEnd: Utils.setDateTime(pickupDate.value, pickupDateTo.value),
        rest: int.parse(quantityPriceController.value.text),
        createdDate: DateTime.now(),
        lastModifyDate: DateTime.now(),
        stores: StoreService.instance.store!.documentId,
        documentId: "",
        status: BagStatus.available.name
      );
      await _appWriteController.createDocument(
          AppWriteCollection.bagsCollections, gp.toJson());
      EasyLoading.dismiss();
      Get.back();
    } catch (e) {
      EasyLoading.showError("An Error Occur");
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
