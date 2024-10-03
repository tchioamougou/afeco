import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/save_food_form_controller.dart';

class SaveFoodFormPage extends GetView<SaveFoodFormController> {
  const SaveFoodFormPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Stack(
        children: [
          Obx(() => Scaffold(
                appBar: AppBar(
                  title: Text('Save Food'),
                  backgroundColor: Colors.white,
                ),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      CustomSelectItem(
                          label: 'Where to share',
                          options: controller.sharingPlaces,
                          selectedValue: controller.sharing.value,
                          onChanged: (val) {
                            controller.sharing.value = val;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      CustomInput(
                        helper: 'List all the products present in your package, separate the product with ;  ',
                          label: 'Contains',
                          onValueChanged: (val) {
                            controller.sharing.value = val;
                          }, hintText: 'list of products',)
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: 0,
              child: CustomBottomAction(onPressed: (){
                Get.toNamed(AppRoutes.TANKING);
              }, text: 'Save', backgroundColor:  Constants.buttonColor))
        ],
      ),
    );
  }
}
