import 'dart:convert';

import 'package:afeco/app/controllers/save_food_detail_controller.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/global_widgets/position_display.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../layouts/main/main_layout.dart';

class SaveFoodDetailPage extends GetView<SaveFoodDetailController> {
  const SaveFoodDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Obx(() => Stack(
            children: [
              if (!controller.loading.value)
                Scaffold(
                  backgroundColor: Constants.defaultBorderColor,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Image.network(
                                    Utils.imageLoader(
                                        controller.gp.value!.imageId),
                                    fit: BoxFit.fitWidth,
                                    height: 200,
                                    width: MediaQuery.sizeOf(context).width,
                                  )
                                ],
                              ),
                              Positioned(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 30, 5, 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const FaIcon(
                                            Icons.arrow_back_ios_new),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.white.withOpacity(0.6),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 9)),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const FaIcon(Icons.share),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white
                                                    .withOpacity(0.6),
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
                                          IconButton(
                                            onPressed: () {},
                                            icon: const FaIcon(
                                                Icons.favorite_border),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white
                                                    .withOpacity(0.6),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 9)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: Tag(
                                  content: 'endingSoon'.tr,
                                  color: Colors.red,
                                  backgroundColor: Colors.red.shade200,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.fromLTRB(10, 1, 10, 100),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0)),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${controller.gp.value?.name}',
                                style: GoogleFonts.timmana(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 35,
                                    color: Constants.defaultHeaderColor),
                              ),
                              const SizedBox(
                                height: 5,
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
                                    content: '${controller.times['day']}',
                                    color: Colors.white,
                                    backgroundColor:
                                        Constants.defaultHeaderColor,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
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
                                  onTap: () {},
                                  leading: FaIcon(
                                    Icons.location_on_outlined,
                                    color: Constants.buttonColor,
                                  ),
                                  title: Text(
                                    '${controller.gp.value?.address}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Constants.defaultHeaderColor,
                                        fontSize: 17),
                                  ),
                                  subtitle: Text('moreAboutStore'.tr),
                                  trailing: Icon(
                                    Icons.chevron_right,
                                    color: Constants.buttonColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Label(title: "aboutContent".tr),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //...controller.gp.value!.getFoodModels().map((e)=>Text('')),
                              Text(
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, color: Colors.grey),
                                  '${controller.gp.value?.products}'),

                              Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Label(title: 'whatYouNeedToKnow'.tr),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('whatYouNeedToKnowAlert'.tr),
                                      ],
                                    ),
                                  )),
                              Label(title: 'address'.tr),
                              PositionDisplay(
                                  pos: LatLng(controller.gp.value!.lat,
                                      controller.gp.value!.long),
                                  title: "here".tr)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      if (controller.reserved.value)
                        CustomBottomAction(
                            onPressed: () {
                              Get.defaultDialog(
                                  title: 'scanQrCode',
                                  titleStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.defaultHeaderColor),
                                  content: Column(
                                    children: [
                                      Text(
                                        "qrCodeScanTitle".tr,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 400,
                                        width: 250,
                                        child: QrImageView(
                                          data: jsonEncode({
                                            'user': UserService
                                                .instance.user!.documentId,
                                            "packageId":
                                                controller.gp.value!.documentId
                                          }),
                                          version: QrVersions.auto,
                                          size: 200.0,
                                          //embeddedImage: AssetImage("assets/image/save_food.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    CustomButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        text: 'confirm'.tr,
                                        backgroundColor: Constants.buttonColor),
                                    CustomButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        text: 'back'.tr,
                                        backgroundColor: Colors.transparent)
                                  ]);
                            },
                            text: 'collect'.tr,
                            backgroundColor: Constants.buttonColor)
                      else
                        CustomBottomAction(
                            onPressed: () {
                              Get.dialog(
                                  barrierDismissible: false,
                                  AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Label(title: 'whatYouNeedToKnow'.tr)
                                      ],
                                    ),
                                    content: Container(
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Text(
                                            'surpriseIsSurprise'.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
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
                                            controller.reserve();
                                            Get.back();
                                          },
                                          text: 'gotIt'.tr,
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
                                                'back'.tr,
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
                                        const EdgeInsets.symmetric(horizontal: 10),
                                  ));
                            },
                            text: 'reserve'.tr,
                            backgroundColor: Constants.buttonColor),
                    ],
                  ))
            ],
          )),
    );
  }
}
