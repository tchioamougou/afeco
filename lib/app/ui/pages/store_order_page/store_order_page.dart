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
                'Order Received',
                style: GoogleFonts.poppins(
                    fontSize: 20, color: Colors.white),
              )),
          body:Obx(() => SingleChildScrollView(
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: controller.bags.map((e)=>MyOrderItem(osm: e,)).toList(),
              ),
            ),
          ),),
        ),
      );
  }
}
