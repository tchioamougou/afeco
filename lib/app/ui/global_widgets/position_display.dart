
import 'package:afeco/app/data/models/market.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PositionDisplay extends StatelessWidget {
  final LatLng pos;
  final String title;
  final double height;
  const PositionDisplay(
      {super.key, required this.pos, required this.title, this.height=300});

  @override
  Widget build(BuildContext context) {
    final Rx<LatLng> center =  LatLng(pos.latitude, pos.longitude).obs;
    final RxDouble zoom = 15.0.obs;
    RxList<Market> markets = <Market>[
      Market(name: '$title', location: center.value)
    ].obs;
    final MapController mapController = MapController();
    return MainLayout(
      child: Obx(() =>
          Container(
            height: height,
            child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                    initialCenter: center.value,
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
                      markers: markets.value
                          .map(
                            (market) =>
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: market.location,
                              child: Row(
                                children: [
                                    IconButton(
                                        onPressed: () {},
                                        tooltip: market.name,
                                        hoverColor: Colors.red,
                                        highlightColor: Constants.buttonColor.withOpacity(0.2),
                                        color: Constants.buttonColor,
                                        icon: const Icon(
                                          FontAwesomeIcons.locationDot,
                                          size: 25,
                                        ))
                                ],
                              ),
                            ),
                      )
                          .toList()),
                ]),
          ),),
    );
  }
}