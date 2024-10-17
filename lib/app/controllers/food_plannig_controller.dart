import 'dart:convert';

import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/food_model.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class FoodPlannigController extends GetxController {
  final RxList<MealPlan> mealPlans = <MealPlan>[].obs;
  Rx<MealPlan?> currentMealPlan = Rx<MealPlan?>(null);
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final SaveFoodAppWriteController _appWriteController = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    getMealPlans();
    super.onInit();
  }

  Future<void> getMealPlans() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.mealPlanCollection, []);
      mealPlans.value =
          dls.documents.map((e) => MealPlan.fromJsonC(e.data)).toList();
      selectDayPlan();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> save(List<MealPlan> plans) async {
    for (var e in plans) {
      Document dc = await _appWriteController
          .createDocument(AppWriteCollection.mealPlanCollection, {
        'users': UserService.instance.user!.documentId,
        'date': e.date.toIso8601String(),
        'recipes': e.recipes.map((e) => jsonEncode(e.toJson())).toList()
      });
      mealPlans.add(MealPlan.fromJsonC(dc.data));
    }
  }
  void selectDayPlan(){
    List<MealPlan> pls = mealPlans.where((e)=>DateUtils.isSameDay(e.date, selectedDate.value)).toList();
    if(pls.isNotEmpty){
      currentMealPlan.value = pls[0];
    }else{
      currentMealPlan.value = Rx<MealPlan?>(null).value;
    }
  }

  @override
  void dispose() async{
    // TODO: implement dispose
   await EasyLoading.dismiss();
    super.dispose();
  }
}
