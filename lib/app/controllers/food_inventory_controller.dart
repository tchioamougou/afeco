
import 'package:afeco/app/data/models/food_model.dart';
import 'package:get/get.dart';
class FoodInventoryController extends GetxController {
  final List<FoodModel> foods = <FoodModel>[].obs;

  void addFood(FoodModel aliment) {
    foods.add(aliment);
  }

  void removeFood(int index) {
    foods.removeAt(index);
  }
}