import 'dart:ffi';

import 'package:afeco/app/data/models/market.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomLocationChoose extends StatelessWidget {
  final VoidCallback onClose;
  final Function(String) onChange;
  const CustomLocationChoose({super.key, required this.onClose, required this.onChange});
  @override
  Widget build(BuildContext context) {
    Rx<double> rang = 2.0.obs;
    final Rx<LatLng> _center = const LatLng(0, 0).obs;
    final RxDouble zoom = 15.0.obs;

    List<Market> markets = <Market>[].obs;
    List<String> withinOptions = ['500 m', '1 Km', '2 km', '3 km'];
    final MapController mapController = MapController();
    return MainLayout(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Constants.defaultBorderColor,
            body: Column(
              children: [
                Container(
                  height: 70,
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose a location to see what\'s available',
                        style: TextStyle(fontSize: 17, color: Constants.defaultHeaderColor, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: onClose, icon: FaIcon(FontAwesomeIcons.x, size: 20,))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height*0.7,
                  child: FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                          initialCenter: _center.value,
                          initialZoom: zoom.value,
                          interactionOptions: const InteractionOptions(
                              flags: ~InteractiveFlag.doubleTapZoom)),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                            markers: markets
                                .map(
                                  (market) => Marker(
                                    width: 80.0,
                                    height: 80.0,
                                    point: market.location,
                                    child: Row(
                                      children: [
                                        if (market.name == "location")
                                          IconButton(
                                              onPressed: () {},
                                              tooltip: market.name,
                                              hoverColor: Colors.red,
                                              highlightColor:
                                                  Colors.deepPurpleAccent,
                                              color: Colors.blue,
                                              icon: const Icon(
                                                Icons.my_location_outlined,
                                                size: 25,
                                              ))
                                      ],
                                    ),
                                  ),
                                )
                                .toList()),
                      ]),
                ),
              ],
            ),
          ),
          Obx(() => Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Label(title: 'Select a distance'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.82,
                          child: Slider(
                            allowedInteraction: SliderInteraction.tapAndSlide,
                            //thumbColor: Colors.white,
                            value: rang.value,
                            onChanged: (va) {
                              rang.value = va;
                            },
                            min: 1,
                            max: 100,
                            activeColor: Constants.buttonColor,
                          ),
                        ),
                        Text('${rang.value.toInt()} Km'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SearchAnchor(builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: controller,
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: Icon(
                          Icons.search,
                          color: Constants.buttonColor,
                        ),
                        elevation: WidgetStatePropertyAll<double>(0.0),
                        backgroundColor: WidgetStatePropertyAll<Color>(
                            Constants.buttonColor.withOpacity(0.2)),
                      );
                    }, suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            controller.closeView(item);
                          },
                        );
                      });
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationArrow,
                              color: Constants.buttonColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'use my current location',
                              style: TextStyle(
                                  color: Constants.defaultHeaderColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        onPressed: () {
                          onChange("Position");
                        },
                        text: 'Apply',
                        backgroundColor: Constants.buttonColor)
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
