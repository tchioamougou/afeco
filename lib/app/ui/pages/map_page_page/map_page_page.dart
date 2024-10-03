import 'package:afeco/app/controllers/map_page_controller.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_select_position.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class MapPage extends GetView<MapPageController> {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        body: Stack(
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
              child: Container(
                child: Column(
                  children: [
                    CustomSelectPosition(
                        label: 'my current position',
                        options: ['5km', '3km'],
                        onChanged: (val) {}),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: FaIcon(
                            FontAwesomeIcons.filter,
                            color: Constants.buttonColor,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.zero),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.SEARCH);
                          },
                          child: FaIcon(
                            Icons.search,
                            color: Constants.buttonColor,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.zero),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        /*floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  controller.mapController.move(controller.center, controller.zoom++);
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  controller.mapController.move(controller.center, controller.zoom--);
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ],
          ),*/
      ),
    );
  }
}
