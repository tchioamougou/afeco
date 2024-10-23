import 'dart:ffi';

import 'package:afeco/app/data/services/find_in_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_filter.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_position.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/find_around_controller.dart';

class FindAroundPage extends GetView<FindAroundController> {
  const FindAroundPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              // Replace this container with your Map widget
              FlutterMap(
                  mapController: controller.mapController,
                  options: MapOptions(
                      initialCenter: controller.center,
                      initialZoom: controller.zoom,
                      interactionOptions: const InteractionOptions(
                          flags: ~InteractiveFlag.doubleTapZoom)),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                        markers: controller.markets
                            .map(
                              (market) => Marker(
                                width: 80.0,
                                height: 80.0,
                                point: market.location,
                                child: Row(
                                  children: [
                                    if (market.name == "location")
                                      IconButton(
                                          onPressed: () {
                                            controller.goToShop();
                                          },
                                          tooltip: market.name,
                                          hoverColor: Colors.red,
                                          highlightColor:
                                              Colors.deepPurpleAccent,
                                          color: Colors.blue,
                                          icon: const Icon(
                                            Icons.my_location_outlined,
                                            size: 25,
                                          ))
                                    else
                                      Column(
                                        children: [
                                          Text(market.name),
                                          IconButton(
                                              onPressed: () {
                                                controller.goToShop();
                                              },
                                              padding: EdgeInsets.zero,
                                              tooltip: market.name,
                                              hoverColor: Colors.red,
                                              highlightColor:
                                                  Colors.deepPurpleAccent,
                                              color: Colors.black,
                                              icon: const Icon(
                                                Icons.location_on_rounded,
                                                size: 40,
                                              ))
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            )
                            .toList()),
                  ]),
              Positioned(
                top: 10.h,
                right: 15,
                left: 15,
                child: Column(
                  children: [
                    CustomSelectPosition(
                      onChanged: (val) {
                        //// Todo refresh the list of store by the all the information,
                        controller.updateUserPosition(val);
                        Get.back();
                      },
                      onClose: () {
                        Get.back();
                      }, placeModel:controller.currentPlace.value,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.dialog(CustomFilter(onClose: () {
                              Get.back();
                            }, onPress: () {
                              Get.back();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.zero),
                          child: FaIcon(
                            FontAwesomeIcons.sliders,
                            color: Constants.buttonColor,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.SEARCH);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.zero),
                          child: FaIcon(
                            Icons.search,
                            color: Constants.buttonColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
