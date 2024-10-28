import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/no_elements/custom_no_element.dart';
import 'package:afeco/app/ui/pages/my_orders_page/my_order_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/store_order_controller.dart';

class StoreOrderPage extends GetView<StoreOrderController> {
      const StoreOrderPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child:  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Constants.defaultHeaderColor,
              title: Text(
                'orderReceived'.tr,
                style: GoogleFonts.poppins(
                    fontSize: 20, color: Colors.white),
              )),
          body:RefreshIndicator(
            onRefresh: controller.getOrders,
            child: Obx((){
              if(controller.bags.isNotEmpty)
              {
                return SingleChildScrollView(
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: controller.bags.map((e)=>MyOrderItem(osm: e,)).toList(),
                    ),
                  ),
                );
              }
              else{
                return CustomNoElement(image: 'assets/image/position.png', title: "No Order received for the moment", description: "Description", actionLabel: "Add New Food", onPress: (){
                  Get.toNamed(AppRoutes.SAVE);
                });
              }
            }),
          ),
        ),
      );
  }
}
