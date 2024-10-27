import 'dart:convert';

import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/option.dart';
import 'package:afeco/app/data/models/place_model.dart';
import 'package:afeco/app/data/models/store_model.dart';
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
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> postalCodeController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> streetController = TextEditingController().obs;
  RxString typeOfBusiness = ''.obs;
  RxString country = "CM".obs;
  RxBool allow = false.obs;
  RxInt index = 0.obs;
  PlaceModel address = PlaceModel();
  RxList<String> raisonJoinedSaveFoods = <String>[].obs;
  RxList<Option> countries = <Option>[].obs;
  RxList<Option> raisonJoinedSaveFoodOptions = <Option>[].obs;
  Future<List<Option>> readJsonData(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return Option.fromJsonList(jsonList);
  }

  @override
  void onInit() async {
    typeBusiness.value = await readJsonData("assets/data/type_business.json");
    countries.value = await readJsonData('assets/data/country.json');
    raisonJoinedSaveFoodOptions.value =
        await readJsonData('assets/data/reason.json');
    super.onInit();
  }

  Future<void> signLog() async {
    if (verifyConnectionInfo() && verifyBusinessInformation()) {
      await EasyLoading.show();
      try {
        /// start by creating the new user in the database and login the user
        User us = await _appWriteController.createStoreAccount(
            emailController.value.text,
            passwordController.value.text,
            businessController.value.text);

        /// After the user is created, create the store related to the user
        StoreModel sm = StoreModel(
            businessName: businessController.value.text,
            typeBusiness: typeOfBusiness.value,
            streetNameNumber: streetController.value.text,
            postalCode: postalCodeController.value.text,
            city: cityController.value.text,
            country: country.value,
            phoneNumber: phoneController.value.text,
            email: emailController.value.text,
            allow: allow.value,
            createdDate: DateTime.now(),
            userId: us.$id,
            lat: double.parse(address.lat ?? '0'),
            long: double.parse(address.lon ?? '0'),
            documentId: "",
            profileCoverId: "",
            profileLogoId: "",
            raisonOfJoining: raisonJoinedSaveFoods.value,
            rating: 0.0,
            totalLikes: 0,
            totalReviews: 0);
        Document dc = await _appWriteController.createDocument(
            AppWriteCollection.storeCollections, sm.toJson());
        StoreService.instance.store = StoreModel.fromJson(dc.data);

        /// After the store is created send a verification Code to the user to verify her identity
        await _appWriteController.sendEmailVerificationCode();
        Get.toNamed(AppRoutes.EMAIL_CONFIRMATION);
      } catch (e) {
        // EasyLoading.showError("An Error Occur");
        print(e);
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  bool verifyBusinessInformation() {
    return businessController.value.text.isNotEmpty &&
        typeOfBusiness.value.isNotEmpty &&
        address.displayName != null &&
        address.displayName!.isNotEmpty &&
        country.value.isNotEmpty &&
        phoneController.value.text.isNotEmpty &&
        phoneController.value.text.isPhoneNumber;
  }

  bool verifyConnectionInfo() {
    return emailController.value.text.isNotEmpty &&
        confirmPasswordController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty &&
        passwordController.value.text == confirmPasswordController.value.text;
  }
}
