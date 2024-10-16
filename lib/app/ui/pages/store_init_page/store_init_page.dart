import 'package:afeco/app/controllers/store_init_controller.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/pages/store_home_page/store_home_page.dart';
import 'package:afeco/app/ui/pages/store_inpact_page/store_inpact_page.dart';
import 'package:afeco/app/ui/pages/store_order_page/store_order_page.dart';
import 'package:afeco/app/ui/pages/store_profile_page/store_profile_page.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';


class StoreInitPage extends GetView<StoreInitController> {
  StoreInitPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Obx(()=>Scaffold(
          backgroundColor: Colors.white,
          body: getBody(),
          bottomNavigationBar: getFooter(),
          floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              elevation: 0,
              onPressed: () {
                Get.toNamed(AppRoutes.SAVE);
              },
              backgroundColor: Constants.buttonColor,
              child:const FaIcon(FontAwesomeIcons.plus,color: Colors.white,)
            //params
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked)),
    );
  }
  List<Widget> pages = [
    const StoreHomePage(),
    const StoreOrderPage(),
    const StoreInpactPage(),
    const StoreProfilePage(),
  ];

  Widget getBody() {
    return IndexedStack(
      index: controller.currentIndex.value,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      FontAwesomeIcons.productHunt,
      FontAwesomeIcons.bagShopping,
      FontAwesomeIcons.chartPie,
      FontAwesomeIcons.circleUser
    ];

    return AnimatedBottomNavigationBar(
      activeColor: Constants.buttonColor,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: controller.currentIndex.value,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 22.sp,
      rightCornerRadius: 10,
      onTap: (index) {
        controller.selectedTab(index);
      },
      //other params
    );
  }

}
