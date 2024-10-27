import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/custom_filter.dart';
import 'package:afeco/app/ui/global_widgets/header_custom.dart';
import 'package:afeco/app/ui/global_widgets/no_elements/custom_alert.dart';
import 'package:afeco/app/ui/pages/offers_page/custom_offer_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/offers_controller.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  OffersController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    controller.getBags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Constants.defaultHeaderColor,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: HeaderCustom(
                        icon: const Icon(
                          FontAwesomeIcons.basketShopping,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPress: () {
                          Get.toNamed(AppRoutes.MY_ORDERS);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
                        child: Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.67,
                                child:  TextField(
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
                      Container(
                        child: Column(
                          children: [
                            if (controller.isSearchError.value)
                              CustomAlert(
                                  image: 'assets/image/angry.png',
                                  title: 'errorOccur'.tr,
                                  actionLabel: 'Find Again',
                                  onPress: () {
                                    controller.getSearchBags();
                                  })
                            else if (!controller.isLoading.value)
                              if (controller.searchBags.isEmpty)
                                CustomAlert(
                                    image: 'assets/image/angry.png',
                                    title: 'noStore'.tr,
                                    actionLabel: 'Clear search',
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
                        ),
                      )
                    else
                    Column(
                      children: controller.bags.value
                          .map((i) => CustomOfferItem(
                        bg: i,
                      ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
