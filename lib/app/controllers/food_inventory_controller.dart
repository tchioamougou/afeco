import 'package:afeco/app/data/models/food_model.dart';
import 'package:afeco/app/data/models/option.dart';
import 'package:get/get.dart';
class FoodInventoryController extends GetxController {
  final List<FoodModel> foods = <FoodModel>[].obs;
  List<Option> foodsCategories = [
    Option(value: "NEIGHBORHOOD", label: "Neighbourhood"),
    Option(value: "FOOD_BANK", label: "Food bank"),
  ];
  RxString foodName = "".obs;
  RxString quantity = "".obs;
  RxString category = "".obs;
  Rx<DateTime> expiredDate=DateTime.now().add(const Duration(days:100 )).obs;

  void addFood() {
    if(foodName.isNotEmpty && quantity.isNotEmpty && category.isNotEmpty){
      FoodModel fd = FoodModel(name: foodName.value, quantity: quantity.value, expirationDate: expiredDate.value, category: category.value);
      foods.add(fd);
      Get.back();
      resetValue();
    }
  }

  void removeFood(int index) {
    foods.removeAt(index);
  }
  void resetValue(){
     foodName = "".obs;
     quantity = "".obs;
     category = "".obs;
     expiredDate=DateTime.now().add(const Duration(days:100 )).obs;
  }
}