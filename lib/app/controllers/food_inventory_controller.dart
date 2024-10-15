import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/food_inventory_model.dart';
import 'package:afeco/app/data/models/food_model.dart';
import 'package:afeco/app/data/models/option.dart';
import 'package:afeco/app/data/services/gemini_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class FoodInventoryController extends GetxController {
  final RxList<FoodInventoryShow> foods = <FoodInventoryShow>[].obs;
  final SaveFoodAppWriteController _appWriteController = Get.find();
  List<Option> foodsCategories = [
    Option(value: "NEIGHBORHOOD", label: "Neighbourhood"),
    Option(value: "FOOD_BANK", label: "Food bank"),
  ];
  RxString category = "".obs;
  Rx<DateTime> expiredDate = DateTime.now().add(const Duration(days: 100)).obs;
  Rx<TextEditingController> foodNameController = TextEditingController().obs;
  Rx<TextEditingController> quantityController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getFoodInventories();
    super.onInit();
  }

  Future<void> getFoodInventories() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.foodInventories, []);
      foods.value =
          dls.documents.map((e) => FoodInventoryShow.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> addItem() async {
    await EasyLoading.show();
    try {
      if (foodNameController.value.text.isNotEmpty &&
          quantityController.value.text.isNotEmpty &&
          category.isNotEmpty) {
        FoodInventoryModel fd = FoodInventoryModel(
            users: UserService.instance.user!.documentId,
            foodName: foodNameController.value.text,
            quantity: quantityController.value.text,
            expirationDate: expiredDate.value,
            category: category.value,
            documentId: "");
        Document dc = await _appWriteController.createDocument(
            AppWriteCollection.foodInventories, fd.toJson());

        foods.add(FoodInventoryShow.fromJson(dc.data));
        Get.back();
        resetValue();
      }
    } catch (e) {
      EasyLoading.showError("An Error Occur");
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void removeFood(int index) {
    foods.removeAt(index);
  }

  Future<void> makePlan() async {
    EasyLoading.show();
    try {
    List<MealPlan> plans = await  GeminiService.generatePlan(foods.value);
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void resetValue() {
    foodNameController.value.text = "";
    quantityController.value.text = "";
    category = "".obs;
    expiredDate = DateTime.now().add(const Duration(days: 100)).obs;
  }
}
