import 'package:afeco/app/data/models/food_model.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FoodPlanningItem extends StatelessWidget {
  final Recipe rcp;

  const FoodPlanningItem({
    super.key,
    required this.rcp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Label(title: rcp.name),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Constants.buttonColor.withOpacity(0.3),
                          width: 1),
                      bottom: BorderSide(
                          color: Constants.buttonColor.withOpacity(0.3),
                          width: 1))),
              child: ListTile(
                dense: true,
                onTap: () {
                  Get.dialog(
                      barrierDismissible: false,
                      AlertDialog(
                        content: Container(
                          height: 250,
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.bowlFood,
                                color: Constants.buttonColor,
                                size: 70,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Label(title: 'ingredients'.tr),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  textAlign: TextAlign.justify,
                                  ingredientsListToString(rcp.ingredients))
                            ],
                          ),
                        ),
                        actions: [
                          CustomButton(
                              onPressed: () {
                                Get.back();
                              },
                              text: 'gotIt'.tr,
                              backgroundColor: Constants.buttonColor)
                        ],
                        insetPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ));
                },
                leading: FaIcon(
                  Icons.location_on_outlined,
                  color: Constants.buttonColor,
                ),
                title: Text(
                  "ingredientsAndAllergens".tr,
                  style: TextStyle(
                      color: Constants.defaultHeaderColor, fontSize: 17),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Constants.buttonColor,
                ),
              ),
            ),
            Label(title: "instructions".tr),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                rcp.instructions,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  String ingredientsListToString(List<FoodModel> ingredients) {
    List<String> ingredientStrings = [];

    for (var ingredient in ingredients) {
      String ingredientString = '';

      if (ingredient.quantity.isNotEmpty) {
        ingredientString += '${ingredient.quantity} ';
      }

      ingredientString += ingredient.name;

      ingredientStrings.add(ingredientString);
    }

    return ingredientStrings.join(', ');
  }
}
