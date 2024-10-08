import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/save_food_form_controller.dart';

class SaveFoodFormPage extends GetView<SaveFoodFormController> {
  const SaveFoodFormPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Stack(
        children: [
          Obx(() => Scaffold(
                appBar: AppBar(
                    backgroundColor: Constants.defaultHeaderColor,
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.circleArrowLeft,
                              size: 30,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    title: Text(
                      'Save food',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colors.white),
                    )),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      CustomSelectItem(
                          label: 'Where to share',
                          options: controller.sharingPlaces,
                          selectedValue: controller.sharing.value,
                          onChanged: (val) {
                            controller.sharing.value = val;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomInput(
                        helper:
                            'List all the products present in your package, separate the product with ;  ',
                        label: 'Contains',
                        onValueChanged: (val) {
                          controller.sharing.value = val;
                        },
                        hintText: 'list of products',
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: 0,
              child: CustomBottomAction(
                  onPressed: () {
                    Get.toNamed(AppRoutes.TANKING);
                  },
                  text: 'Save',
                  backgroundColor: Constants.buttonColor))
        ],
      ),
    );
  }
}
