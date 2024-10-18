import 'package:afeco/app/controllers/my_save_food_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_save_food_neighbourdhood_item.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';


class MySaveFoodPage extends GetView<MySaveFoodController> {
  const MySaveFoodPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'My Bags'.tr,),
        body:Obx(() => SingleChildScrollView(
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Label(title: 'My reserved bags'),
                Column(
                  children: controller.bags.map((e)=>CustomSaveFoodNeighbourdhoodItem(gp: e)).toList(),
                ),
                Label(title: 'My Giving Back'),
                Column(
                  children: controller.bags.map((e)=>CustomSaveFoodNeighbourdhoodItem(gp: e)).toList(),
                )
              ],
            ),
          ),
        ),),
      ),
    );
  }
}
