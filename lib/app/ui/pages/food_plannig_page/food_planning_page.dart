import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/pages/food_plannig_page/food_planning_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weekly_calendar/weekly_calendar.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/food_plannig_controller.dart';

class FoodPlanningPage extends GetView<FoodPlannigController> {
  const FoodPlanningPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Obx(() => Scaffold(
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
              'Food Planning',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
            actions: [
              CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.FOOD_INVENTORY);
                  },
                  text: 'Food inventory',
                  backgroundColor: Colors.deepOrange)
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: WeeklyCalendar(
                    calendarStyle: CalendarStyle(
                        locale: "en",
                        selectedCircleColor: Constants.defaultHeaderColor),
                    onChangedSelectedDate: (date) {
                      controller.selectedDate.value = date;
                      controller.selectDayPlan();
                    },
                  ),
                ),
                if (controller.currentMealPlan.value != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: controller.currentMealPlan.value!.recipes
                          .map((e) => Column(
                                children: [
                                  Label(title: e.mealType.name.toUpperCase()),
                                  FoodPlanningItem(
                                    rcp: e,
                                  ),
                                ],
                              ))
                          .toList(),
                    ),
                  )
                else
                  const Center(
                    child: Text('No planing for today'),
                  )
              ],
            ),
          ))),
    );
  }
}
