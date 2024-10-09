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
      const FoodPlanningPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Scaffold(
          appBar:  AppBar(
              backgroundColor: Constants.defaultHeaderColor,
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: const FaIcon(FontAwesomeIcons.circleArrowLeft,size: 30,color: Colors.white,))
                ],
              ),
              title: Text(
                'Food Planning',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
          actions: [CustomButton(onPressed: (){
            Get.toNamed(AppRoutes.FOOD_INVENTORY);
          }, text: 'Food inventory', backgroundColor: Colors.deepOrange)],
          ),
          body:SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: WeeklyCalendar(
                    calendarStyle: CalendarStyle(
                      locale: "en",
                      selectedCircleColor: Constants.defaultHeaderColor
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Label(title: 'Breakfast'),
                    Column(
                      children: List.generate(2, (i)=>FoodPlanningItem(onPress: (){}, title: 'Couscous sauce gombo', image: 'assets/image/save_food.png',cal: "10",time: "10",)),
                    ),
                    Label(title: 'Lunch'),
                    Column(
                      children: List.generate(2, (i)=>FoodPlanningItem(onPress: (){}, title: 'Couscous sauce gombo', image: 'assets/image/save_food.png',cal: "10",time: "10",)),
                    ),
                    Label(title: 'Dinner'),
                    Column(
                      children: List.generate(2, (i)=>FoodPlanningItem(onPress: (){}, title: 'Couscous sauce gombo', image: 'assets/image/save_food.png',cal: "10",time: "10",)),
                    ),
                  ],
                ),
                )

              ],
            ),
          )
        ),
      );
  }
}
