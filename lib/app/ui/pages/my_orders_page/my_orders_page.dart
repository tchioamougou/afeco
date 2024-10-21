import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
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
          body:Obx(() => SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: controller.bags.map((e)=>MyOrderItem(osm: e,)).toList(),
              ),
            ),
          ),),
        ),
      );
  }
}
