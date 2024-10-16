import 'dart:convert';

import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/option.dart';
import 'package:afeco/app/data/models/place_model.dart';
import 'package:afeco/app/data/models/store_model.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final SaveFoodAppWriteController _appWriteController = Get.find();
  RxList<Option> typeBusiness = <Option>[].obs;
  Rx<TextEditingController> businessController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> postalCodeController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> streetController = TextEditingController().obs;
  RxString typeOfBusiness = ''.obs;
  RxString country = "CM".obs;

  PlaceModel address = PlaceModel();
  Future<List<Option>> readJsonData() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/type_business.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return Option.fromJsonList(jsonList);
  }

  RxList<Option> countries = <Option>[].obs;
  Future<List<Option>> readJsonDataCountry() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/country.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return Option.fromJsonList(jsonList);
  }

  @override
  void onInit() async {
    typeBusiness.value = await readJsonData();
    countries.value = await readJsonDataCountry();
    super.onInit();
  }

  // Méthode pour soumettre le formulaire
  Future<void> submitForm() async {
    await EasyLoading.show();
    try {
      StoreModel sm = StoreModel(
          businessName: businessController.value.text,
          typeBusiness: typeOfBusiness.value,
          streetNameNumber: streetController.value.text,
          postalCode: postalCodeController.value.text,
          city: cityController.value.text,
          country: country.value,
          phoneNumber: phoneController.value.text,
          email: emailController.value.text,
          allow: true,
          createdDate: DateTime.now(),
          userId: SessionService.instance.currentSession!.userId,
          lat: double.parse(address.lat ?? '0'),
          long: double.parse(address.lon ?? '0'),
          documentId: "",
          profileCoverId: "",
          profileLogoId: "");
      Document dc = await _appWriteController.createDocument(
          AppWriteCollection.storeCollections, sm.toJson());
      StoreService.instance.store = StoreModel.fromJson(dc.data);
    } catch (e) {
      EasyLoading.showError("An Error Occur");
      print(e);
      return Future.error(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> signLog() async {
    if (phoneController.value.text.isNotEmpty) {
      await EasyLoading.show();
      try {
        await _appWriteController.createPhone(phoneController.value.text);
        Get.toNamed(AppRoutes.SMS_VERIFICATION);
      } catch (e) {
        // EasyLoading.showError("An Error Occur");
        print(e);
      } finally {
        EasyLoading.dismiss();
      }
    }
  }
}
