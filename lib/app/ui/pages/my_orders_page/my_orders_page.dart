import 'package:afeco/app/ui/pages/my_orders_page/my_order_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/my_orders_controller.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
      const MyOrdersPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Scaffold(
          backgroundColor: Colors.white,
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
                'My Orders',
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
