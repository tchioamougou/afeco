import 'package:afeco/app/data/models/market.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomLocationChoose extends StatelessWidget {
  final VoidCallback onClose;
  final Function(LatLng) onChange;
  final Function(int) onChangeRange;
  const CustomLocationChoose(
      {super.key, required this.onClose, required this.onChange, required this.onChangeRange});

  @override
  Widget build(BuildContext context) {
    Rx<double> rang = 2.0.obs;
    final Rx<LatLng> _center = const LatLng(51.509364, -0.128928).obs;
    final RxDouble zoom = 15.0.obs;
    RxList<Market> markets = <Market>[].obs;
    RxBool _userCurrentPosition = false.obs;
    final Rx<LatLng> selectedValue = const LatLng(0, 0).obs;
    final MapController mapController = MapController();
    return MainLayout(
      child: Obx(() => Stack(
            children: [
              Scaffold(
                backgroundColor: Constants.defaultBorderColor,
                body: Column(
                  children: [
                    Container(
                      height: 70,
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose a location to see what\'s available',
                            style: TextStyle(
                                fontSize: 17,
                                color: Constants.defaultHeaderColor,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: onClose,
                              icon: const FaIcon(
                                FontAwesomeIcons.x,
                                size: 20,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: FlutterMap(
                          mapController: mapController,
                          options: MapOptions(
                              onTap: (tap, val) {
                                print('$tap');
                                print('$val');
                                markets.clear();
                                selectedValue.value = val;
                                markets.add(
                                    Market(name: "location", location: val));
                              },
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
                                markers: markets.value
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                                allowedInteraction:
                                    SliderInteraction.tapAndSlide,
                                //thumbColor: Colors.white,
                                value: rang.value,
                                onChanged: (va) {
                                  rang.value = va;
                                  onChangeRange(va.toInt());
                                },
                                min: 1,
                                max: 100,
                                activeColor: Constants.buttonColor,
                              ),
                            ),
                            Text('${rang.value.toInt()} Km'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SearchAnchor(builder: (BuildContext context,
                            SearchController controller) {
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
                            elevation:
                                const WidgetStatePropertyAll<double>(0.0),
                            backgroundColor: WidgetStatePropertyAll<Color>(
                                Constants.buttonColor.withOpacity(0.2)),
                          );
                        }, suggestionsBuilder: (BuildContext context,
                            SearchController controller) {
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
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () async {
                              final position = await getCurrentPosition();
                              selectedValue.value =
                                  LatLng(position.latitude, position.longitude);
                              markets.clear();
                              markets.add(Market(
                                  name: "location",
                                  location: LatLng(
                                      position.latitude, position.longitude)));
                              _userCurrentPosition.value = true;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.locationArrow,
                                  color: Constants.buttonColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Use my current location',
                                  style: TextStyle(
                                      color: Constants.defaultHeaderColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            onPressed: () async {
                              onChange(selectedValue.value);
                            },
                            disable: selectedValue.value.longitude == 0,
                            text: _userCurrentPosition.value
                                ? 'Choose location'
                                : 'Apply',
                            backgroundColor: Constants.buttonColor)
                      ],
                    ),
                  )))
            ],
          )),
    );
  }

  Future<Position> getCurrentPosition() async {
    final _geolocatorPlatform = GeolocatorPlatform.instance;
    EasyLoading.show();
    try {
      final hasPermission =
          await _geolocatorPlatform.isLocationServiceEnabled();
      if (!hasPermission) {
        EasyLoading.dismiss();
        EasyLoading.showError('Location services are disabled.');
        return Future.error('Location services are disabled.');
      }
      LocationPermission permission =
          await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        EasyLoading.dismiss();
        EasyLoading.showError('Location permission denied.');
        return Future.error('Location permission denied.');
      }
      final position = await _geolocatorPlatform.getCurrentPosition();
      EasyLoading.dismiss();
      return position;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        //
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        //
      }
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }
}
