import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/no_elements/custom_alert.dart';
import 'package:afeco/app/ui/pages/my_orders_page/my_order_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/my_orders_controller.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
      const MyOrdersPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(title: 'myOrders'.tr,),
          body:Obx((){
            if(!controller.isLoading.value){
              if(controller.isError.value){
                return CustomAlert(title: 'errorOccur'.tr, actionLabel: 'tryAgain'.tr, onPress: (){
                  controller.getOrders();
                });
              }else if(controller.bags.isNotEmpty){
                return SingleChildScrollView(
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: controller.bags.map((e)=>MyOrderItem(osm: e,)).toList(),
                    ),
                  ),
                );
              }else{
                return CustomAlert(title: 'noOrder'.tr, actionLabel: 'continueShop'.tr, onPress: (){});
              }
            }else{
              return Container();
            }
          }),
        ),
      );
  }
}
