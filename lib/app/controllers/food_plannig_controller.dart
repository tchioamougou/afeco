import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/food_model.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class FoodPlannigController extends GetxController {
  final RxList<MealPlan> mealPlans = <MealPlan>[].obs;
  Rx<MealPlan?> currentMealPlan = Rx<MealPlan?>(null);
  final SaveFoodAppWriteController _appWriteController = Get.find();

  void onInit() {
    // TODO: implement onInit
    getMealPlans();
    super.onInit();
  }

  Future<void> getMealPlans() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.foodInventories, []);
      mealPlans.value =
          dls.documents.map((e) => MealPlan.fromJson(e.data)).toList();
      if (mealPlans.isNotEmpty) {
        currentMealPlan.value = mealPlans[0];
      }
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
