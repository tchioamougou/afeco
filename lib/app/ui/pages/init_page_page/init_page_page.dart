import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/pages/home_page/home_page.dart';
import 'package:afeco/app/ui/pages/map_page_page/map_page_page.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../../../controllers/init_page_controller.dart';

class InitPagePage extends GetView<InitPageController> {
       InitPagePage ({Key? key}) : super(key: key);
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
                  Get.toNamed(AppRoutes.SAVE_FOOD_FORM);
                },
                child:FaIcon(FontAwesomeIcons.bowlFood,color: Colors.white,),
                backgroundColor: Constants.buttonColor
              //params
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked)),
      );
  }
      List<Widget> pages = [
        const HomePage(),
        const MapPage(),
        const Text(""),
        const Text(""),
      ];
      Widget getBody() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        );
      }

      Widget getFooter() {
        List<IconData> iconItems = [
          Icons.adjust,
          Icons.map,
          Icons.tag,
          Icons.person_pin
        ];

        return AnimatedBottomNavigationBar(
          activeColor: Constants.buttonColor,
          inactiveColor: Colors.black.withOpacity(0.5),
          icons: iconItems,
          activeIndex: controller.currentIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10,
          iconSize: 28.sp,
          rightCornerRadius: 10,
          onTap: (index) {
            controller.selectedTab(index);
          },
          //other params
        );
      }

}
