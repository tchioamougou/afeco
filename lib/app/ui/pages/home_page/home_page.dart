import 'package:afeco/app/controllers/init_page_controller.dart';
import 'package:afeco/app/data/services/filter_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/custom_category_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_filter.dart';
import 'package:afeco/app/ui/global_widgets/custom_position_not_set.dart';
import 'package:afeco/app/ui/global_widgets/custom_save_food_neighbourdhood_item.dart';
import 'package:afeco/app/ui/global_widgets/custom_store_view.dart';
import 'package:afeco/app/ui/global_widgets/donate_Widget.dart';
import 'package:afeco/app/ui/global_widgets/header_custom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/global_widgets/no_elements/custom_alert.dart';
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
    if(FilterService.instance.filter.showNeighborPackages){
      controller.getGivingPacks();
    }
    controller.getBags();
    if (FilterService.instance.filter.showSoldHow) {
      controller.getBagsSoldOut();
    }
    if(UserService.instance.user!.storesLiked.isNotEmpty){
      controller.getLikedStore();
    }
    super.initState();
  }
   Future<void> refresh() async {
     if(FilterService.instance.filter.showNeighborPackages){
       controller.getGivingPacks();
     }
     controller.getBags();
     if (FilterService.instance.filter.showSoldHow) {
       controller.getBagsSoldOut();
     }
     if(UserService.instance.user!.storesLiked.isNotEmpty){
       controller.getLikedStore();
     }
   }
  @override
  Widget build(BuildContext context) {
    InitPageController initPageController = Get.find();
    return MainLayout(
      child: Obx(() {
        if (!controller.hasPosition.value) {
          return CustomPositionNotSet(
            refresh: () {
              Get.delete<HomeController>();
              Get.put(HomeController());
            },
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Container(
              color: Constants.defaultHeaderColor,
              child: RefreshIndicator(
                onRefresh: refresh,
                child: SafeArea(child: SingleChildScrollView(
                    child: Container(
                      color: Colors.grey.shade100,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                child: HeaderCustom(
                                  icon: const Icon(
                                    FontAwesomeIcons.bell,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  onPress: () {
                                    Get.toNamed(AppRoutes.NOTIFICATIONS);
                                  },
                                ),
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
                                            width: 0.1,
                                            color: Constants.defaultBorderColor),
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
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width * 0.67,
                                          child: TextField(
                                            controller: controller.searchController,
                                            onSubmitted: (value) {
                                              if (value.isNotEmpty) {
                                                controller.isSearching.value = true;
                                                controller.getSearchBags();
                                              } else {
                                                controller.isSearching.value = false;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "searchHere".tr,
                                            ),
                                            textInputAction: TextInputAction.search,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.dialog(CustomFilter(
                                              onClose: () {
                                                Get.back();
                                              },
                                              onPress: () {
                                                setState(() {
                                                  refresh();
                                                });
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
                              if (controller.isSearching.value)
                                Column(
                                  children: [
                                    if (controller.isSearchError.value)
                                      CustomAlert(
                                          image: 'assets/image/angry.png',
                                          title: 'errorOccur'.tr,
                                          actionLabel: 'findAgain'.tr,
                                          onPress: () {
                                            controller.getSearchBags();
                                          })
                                    else if (!controller.isLoading.value)
                                      if (controller.searchBags.isEmpty)
                                        CustomAlert(
                                            image: 'assets/image/angry.png',
                                            title: 'noStore'.tr,
                                            actionLabel: 'clearSearch'.tr,
                                            onPress: () {
                                              controller.searchController.text = '';
                                              controller.isSearching.value = false;
                                            })
                                      else
                                        ...controller.searchBags
                                            .map((f) => CustomCardItem(
                                          bg: f,
                                          width: 0.97,
                                        ))
                                  ],
                                )
                              else
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: Label(title: 'quickActions'.tr),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: controller.quickActions
                                              .map((e) => CustomCategoryAction(
                                            onPress: () {
                                              if (e['title'] == 'Planning') {
                                                Get.toNamed(
                                                    AppRoutes.FOOD_PLANNING);
                                              } else if (e['title'] == 'Orders') {
                                                Get.toNamed(AppRoutes.MY_ORDERS);
                                              } else if (e['title'] ==
                                                  'C02 Views') {
                                                initPageController.selectedTab(3);
                                              } else {
                                                Get.toNamed(
                                                    AppRoutes.MY_SAVE_FOOD);
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
                                      if(FilterService.instance.filter.showNeighborPackages && controller.givingPackages.isNotEmpty)
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Label(title: 'forYou'.tr),
                                                  SeeAll(onPress: () {
                                                    controller.viewAllNei(
                                                        'forYou'.tr, controller.givingPackages);
                                                  })
                                                ],
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: controller.givingPackages
                                                    .map(
                                                        (i) => CustomSaveFoodNeighbourdhoodItem(
                                                      gp: i,
                                                    ))
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Label(title: 'recommendForYou'.tr),
                                            SeeAll(onPress: () {
                                              controller.viewAll(
                                                  'recommendForYou'.tr, controller.bags);
                                            })
                                          ],
                                        ),
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
                                      /// Save before it's too late
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Label(title: 'saveBeforeTooLate'.tr),
                                                SeeAll(onPress: () {
                                                  controller.viewAll(
                                                      'saveBeforeTooLate'.tr, controller.bags);
                                                })
                                              ],
                                            ),
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
                                      ///--- ends
                                      ///New bags
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Label(title: 'newsBags'.tr),
                                                SeeAll(onPress: () {
                                                  controller.viewAll(
                                                      'newsBags'.tr, controller.bags);
                                                })
                                              ],
                                            ),
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
                                      ///--- ends
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const DonateWidget(),

                                      /// There where popular today
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Label(title: 'popularToday'.tr),
                                            SeeAll(onPress: () {
                                              controller.viewAll(
                                                  'popularToday'.tr, controller.bags);
                                            })
                                          ],
                                        ),
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
                                      /// end
                                      /// Sold out
                                      if (FilterService.instance.filter.showSoldHow && controller.soldOuts.isNotEmpty)
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(10, 0, 20, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Label(title: 'soldOut'.tr),
                                                  SeeAll(onPress: () {
                                                    controller.viewAll('soldOut'.tr,
                                                        controller.soldOuts);
                                                  })
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: controller.soldOuts
                                                    .map((i) => CustomCardItem(
                                                  bg: i,
                                                ))
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      /// --- End

                                      /// Sold out
                                      if (controller.likedStores.isNotEmpty)
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(10, 0, 20, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Label(title: 'yourFavorite'.tr),
                                                  SeeAll(onPress: () {
                                                    controller.viewAllFavorite('yourFavorite'.tr,
                                                        controller.likedStores);
                                                  })
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: controller.likedStores
                                                    .map((i) => CustomStoreView(
                                                  store: i,
                                                ))
                                                    .toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      /// --- End
                                    ],
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),),
            ),
          );
        }
      }),
    );
  }
}

class SeeAll extends StatelessWidget {
  const SeeAll({super.key, required this.onPress});
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        children: [
          Text(
            'seeAll'.tr,
            style: TextStyle(
                color: Constants.defaultHeaderColor,
                fontWeight: FontWeight.bold),
          ),
          Icon(Icons.chevron_right, color: Constants.defaultHeaderColor)
        ],
      ),
    );
  }
}
