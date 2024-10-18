import 'package:afeco/app/controllers/init_page_controller.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/custom_category_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_filter.dart';
import 'package:afeco/app/ui/global_widgets/custom_save_food_neighbourdhood_item.dart';
import 'package:afeco/app/ui/global_widgets/donate_Widget.dart';
import 'package:afeco/app/ui/global_widgets/header_custom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    controller.getGivingPacks();
    controller.getBags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InitPageController initPageController = Get.find();
    return MainLayout(
      child: Obx(() => Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
                child: Column(
              children: [
                 Padding(
                  padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
                  child: HeaderCustom(icon:  Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.white,
                    size: 25,
                  ),onPress: (){
                    Get.toNamed(AppRoutes.NOTIFICATIONS);
                  },),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.1, color: Constants.defaultBorderColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.search,
                              color: Constants.buttonColor,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                padding: EdgeInsets.zero),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.67,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "search here",
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.dialog(CustomFilter(
                                onClose: () {
                                  Get.back();
                                },
                                onPress: () {
                                  Get.back();
                                },
                              ));
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.sliders,
                              color: Constants.buttonColor,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                padding: EdgeInsets.zero),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Label(title: 'Category'),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.quickActions
                              .map((e) => CustomCategoryAction(
                                    onPress: () {
                                      if (e['title'] == 'Planning') {
                                        Get.toNamed(AppRoutes.FOOD_PLANNING);
                                      } else if (e['title'] == 'Offers') {
                                        Get.toNamed(AppRoutes.MY_ORDERS);
                                      } else if (e['title'] == 'C20 Views') {
                                        initPageController.selectedTab(3);
                                      }else{
                                        Get.toNamed(AppRoutes.MY_SAVE_FOOD);
                                      }
                                    },
                                    title: e['title']!,
                                    image: e['image']!,
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Label(title: 'Food for you'),
                            TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chevron_right,color: Constants.defaultHeaderColor),
                                iconAlignment: IconAlignment.end,
                                label: Text(
                                  'See all',
                                  style: TextStyle(
                                      color: Constants.defaultHeaderColor),
                                ))
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.givingPackages
                              .map((i) => CustomSaveFoodNeighbourdhoodItem(
                                    gp: i,
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: Label(title: 'Recommend for you'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.bags.value
                              .map((i) => CustomCardItem(
                                    bg: i,
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: Label(title: 'Collect Now'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.bags.value
                              .map((i) => CustomCardItem(
                                    bg: i,
                                  ))
                              .toList(),
                        ),
                      ),
                      DonateWidget(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: Label(title: 'Sold out'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.bags.value
                              .map((i) => CustomCardItem(
                                    bg: i,
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
          )),
    );
  }
}
