import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_payment_method.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/global_widgets/position_display.dart';
import 'package:afeco/app/ui/global_widgets/quantity_selector.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/global_widgets/time_left.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/offer_details_controller.dart';

class OfferDetailsPage extends GetView<OfferDetailsController> {
  const OfferDetailsPage({super.key});

  void initPayment() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        isDismissible: false,
        Obx(() => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('paymentMethod'.tr.toUpperCase()),
                      CustomSelectPaymentMethod(onChanged: (val) {
                        controller.selectPaymentMethod.value = val;
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'total'.toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                            Text(
                              '${controller.bag.value!.price * controller.selectQuantity.value}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QuantitySelector(
                              initialQuantity: 1,
                              minValue: 1,
                              maxValue: controller.bag.value!.rest,
                              onQuantityChanged: (val) {
                                controller.selectQuantity.value = val;
                              }),
                          Text(
                            'Only ${controller.bag.value!.rest} Left',
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                color: Colors.orange,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                          onPressed: () async {
                            controller.payNow();
                            Get.back();
                          },
                          disable: controller.selectPaymentMethod.isEmpty,
                          text: 'reserve'.tr,
                          backgroundColor: Constants.buttonColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'back'.tr,
                                style: TextStyle(
                                    color: Constants.defaultHeaderColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.sizeOf(Get.context!).width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('termsNotify'.tr),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  'termsAndConditions'.tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Constants.defaultHeaderColor),
                                ))
                          ],
                        ),
                      ))
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(() => Stack(
                children: [
                  if (!controller.loading.value)
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Image.network(
                                        Utils.imageLoader(controller
                                            .bag.value!.stores.profileCoverId),
                                        fit: BoxFit.fitWidth,
                                        height: 200,
                                        width: MediaQuery.sizeOf(context).width,
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 30, 5, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: const FaIcon(
                                              Icons.arrow_back_ios_new,
                                              color: Colors.white,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors
                                                    .transparent
                                                    .withOpacity(0.4),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 9)),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  GlobalService.shareBag(
                                                      controller.bag.value!);
                                                },
                                                icon: const FaIcon(
                                                  Icons.share,
                                                  color: Colors.white,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .transparent
                                                        .withOpacity(0.4),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 9)),
                                              ),
                                              IconButton(
                                                onPressed: () async {
                                                  controller.like.value =
                                                      !controller.like.value;
                                                  await GlobalService
                                                      .updateUserLikes(
                                                          controller
                                                              .bag
                                                              .value!
                                                              .stores
                                                              .documentId);
                                                },
                                                icon: FaIcon(
                                                  controller.like.value
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: Colors.white,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .transparent
                                                        .withOpacity(0.4),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 9)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (controller.bag.value!.status ==
                                      BagStatus.soldOut.name)
                                    Positioned(
                                      right: 10,
                                      bottom: 10,
                                      child: Tag(
                                        content: 'ended'.tr,
                                        color: Constants.defaultHeaderColor,
                                        backgroundColor: Colors.grey,
                                      ),
                                    )
                                  else
                                    Positioned(
                                      right: 10,
                                      bottom: 10,
                                      child: Tag(
                                        content: 'endingSoon'.tr,
                                        color: Colors.red,
                                        backgroundColor: Colors.red.shade200,
                                      ),
                                    ),
                                  Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(300),
                                                border: Border.all(
                                                    color: Constants
                                                        .defaultBorderColor,
                                                    width: 1)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(300),
                                              child: Image.network(
                                                Utils.imageLoader(controller
                                                    .bag
                                                    .value!
                                                    .stores
                                                    .profileLogoId),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            controller
                                                .bag.value!.stores.businessName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.shopping_bag_outlined,
                                            size: 20,
                                            color: Constants.buttonColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            controller.bag.value!.name,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_outlined,
                                            size: 20,
                                            color: Constants.buttonColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            '4.9',
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            '(41)',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.lock_clock,
                                            size: 20,
                                            color: Constants.buttonColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${"pickUp".tr}: ${controller.times['time']}',
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Tag(
                                            content:
                                                '${controller.times['day']}',
                                            color: Colors.white,
                                            backgroundColor:
                                                Constants.defaultHeaderColor,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${Constants.oCameroon.format(controller.bag.value!.originalPrice)}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '${Constants.oCameroon.format(controller.bag.value!.price)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16,
                                            color:
                                                Constants.defaultHeaderColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0.3),
                                          width: 1),
                                      bottom: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0.3),
                                          width: 1))),
                              child: ListTile(
                                dense: true,
                                onTap: () {
                                  Get.toNamed(AppRoutes.STORE_DETAIL,arguments: controller.bag.value!.stores);
                                },
                                leading: FaIcon(
                                  Icons.location_on_outlined,
                                  color: Constants.buttonColor,
                                ),
                                title: Text(
                                  '${controller.bag.value?.stores.streetNameNumber}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Constants.defaultHeaderColor,
                                      fontSize: 14),
                                ),
                                subtitle: Text('moreAboutStore'.tr),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: Constants.buttonColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'whatYouCouldGet'.tr,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/image/save_food.png",
                                        height: 100,
                                      ),
                                      Expanded(
                                          child: Text("surpriseBagMessage".tr))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0.3),
                                          width: 1),
                                      bottom: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0.3),
                                          width: 1))),
                              child: ListTile(
                                dense: true,
                                onTap: () {
                                  Get.dialog(
                                      barrierDismissible: false,
                                      AlertDialog(
                                        content: Container(
                                          height: 250,
                                          child: Column(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.bagShopping,
                                                color: Constants.buttonColor,
                                                size: 70,
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "surpriseIsSurprise".tr,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  textAlign: TextAlign.justify,
                                                  "preventReserveMessage".tr),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          CustomButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              text: 'gotIt'.tr,
                                              backgroundColor:
                                                  Constants.buttonColor)
                                        ],
                                        insetPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10),
                                      ));
                                },
                                leading: FaIcon(
                                  Icons.location_on_outlined,
                                  color: Constants.buttonColor,
                                ),
                                title: Text(
                                  "ingredientsAndAllergens".tr,
                                  style: TextStyle(
                                      color: Constants.defaultHeaderColor,
                                      fontSize: 17),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: Constants.buttonColor,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0),
                                          width: 1),
                                      bottom: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0.15),
                                          width: 1))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'whatOtherSay'.tr,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Constants.buttonColor
                                                .withOpacity(0.3),
                                            width: 1),
                                        bottom: BorderSide(
                                            color: Constants.buttonColor
                                                .withOpacity(0.3),
                                            width: 1))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'whatYouNeedToKnow'.tr,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('whatYouNeedToKnowAlert'.tr),
                                    ],
                                  ),
                                )),
                            Label(title: 'address'.tr),
                            PositionDisplay(
                                pos: LatLng(controller.bag.value!.stores.lat,
                                    controller.bag.value!.stores.long),
                                title: "here".tr)
                          ],
                        ),
                      ),
                    ),
                  if (!controller.loading.value)
                    Positioned(
                        bottom: 0,
                        child: Column(
                          children: [
                            if (controller.bag.value!.pickupDateEnd
                                .isAfter(DateTime.now()))
                              TimeLeft(
                                  targetDate:
                                      controller.bag.value!.pickupDateEnd),
                            if (controller.bag.value!.status ==
                                BagStatus.soldOut.name)
                              CustomBottomAction(
                                  onPressed: () {},
                                  text: 'soldOut'.tr,
                                  backgroundColor:
                                      Constants.buttonColor.withOpacity(0.2))
                            else
                              CustomBottomAction(
                                  onPressed: () {
                                    Get.dialog(
                                        barrierDismissible: false,
                                        AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Label(
                                                  title:
                                                      'What you have to know')
                                            ],
                                          ),
                                          content: Container(
                                            height: 150,
                                            child: const Column(
                                              children: [
                                                Text(
                                                  'Your surprise Bags is a surprise',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    textAlign:
                                                        TextAlign.justify,
                                                    "We wish we could tell you what exactly will be in your Surprise Bag - but it's always a surprise! The store wil fill it with a selection of their unsold items. if you have a question about allergens or ingredients, please ask to the store."),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            CustomButton(
                                                onPressed: () {
                                                  Get.back();
                                                  initPayment();
                                                },
                                                text: 'Got it!',
                                                backgroundColor:
                                                    Constants.buttonColor),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      'Back',
                                                      style: TextStyle(
                                                          color: Constants
                                                              .defaultHeaderColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))
                                              ],
                                            )
                                          ],
                                          insetPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                        ));
                                  },
                                  text: 'reserve'.tr,
                                  backgroundColor: Constants.buttonColor)
                          ],
                        ))
                ],
              ))),
    );
  }
}
