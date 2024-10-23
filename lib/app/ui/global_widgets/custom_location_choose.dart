import 'dart:convert';

import 'package:afeco/app/data/models/market.dart';
import 'package:afeco/app/data/models/place_model.dart';
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
import 'package:http/http.dart' as http;

class CustomLocationChoose extends StatefulWidget {
  final PlaceModel? defaultValue;
  final VoidCallback onClose;
  final Function(PlaceModel) onChange;

  const CustomLocationChoose({
    super.key,
    required this.onClose,
    required this.onChange,
    this.defaultValue,
  });

  @override
  State<CustomLocationChoose> createState() => _CustomLocationChooseState();
}

class _CustomLocationChooseState extends State<CustomLocationChoose> {
  RxList<PlaceModel> address = <PlaceModel>[].obs;
  SearchController searchController = SearchController();
  bool isLoading = false;
  Rx<double> rang = 2.0.obs;
  final Rx<LatLng> _center = const LatLng(51.509364, -0.128928).obs;
  final RxDouble zoom = 18.0.obs;
  RxList<Market> markets = <Market>[].obs;
  RxBool _userCurrentPosition = false.obs;
  Rx<PlaceModel> selectedValue = PlaceModel().obs;
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null && widget.defaultValue!.lon!.isNotEmpty) {
      selectedValue.value = widget.defaultValue!;
      searchController.text = selectedValue.value.displayName ?? "";
      rang.value = selectedValue.value.distance!.toDouble();
      _center.value =  LatLng(double.parse(selectedValue.value.lat??"0.0"), double.parse(selectedValue.value.lon??"0.0"));
      markets.add(Market(name: "${selectedValue.value.name}", location: _center.value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Obx(() => Stack(
            children: [
              Scaffold(
                backgroundColor: Constants.defaultBorderColor,
                body: SingleChildScrollView(
                  child: Column(
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
                                onPressed: widget.onClose,
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
                                onTap: (tap, val) async {
                                  markets.clear();
                                  markets.add(
                                      Market(name: "location", location: val));
                                  PlaceModel cs =
                                      await getAddressFromCoordinates(
                                          val.latitude, val.longitude);
                                  searchController.text = cs.displayName ?? '';
                                  selectedValue.value = cs;
                                  address.value = [];
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
                                              IconButton(
                                                  onPressed: () {},
                                                  tooltip: market.name,
                                                  hoverColor: Colors.red,
                                                  highlightColor: Constants
                                                      .defaultHeaderColor,
                                                  color: Colors.blue,
                                                  icon: const Icon(
                                                    FontAwesomeIcons
                                                        .locationDot,
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
                                  selectedValue.value.distance = va.toInt();
                                },
                                min: 0,
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
                        SearchAnchor(
                          searchController: searchController,
                          builder: (BuildContext context,
                              SearchController controller) {
                            return SearchBar(
                              controller: controller,
                              padding: const WidgetStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 16.0)),
                              onTap: () {
                                controller.openView();
                              },
                              onChanged: (val) async {
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
                          },
                          suggestionsBuilder: (BuildContext context,
                              SearchController controller) {
                            return address.value.map((e) => ListTile(
                                  title: Text(e.displayName!),
                                  onTap: () {
                                    selectedValue.value = e;
                                    LatLng position = LatLng(
                                        double.parse(e.lat!),
                                        double.parse(e.lon!));
                                    markets.clear();
                                    markets.add(Market(
                                        name: "you", location: position));
                                    controller.closeView(e.displayName);
                                    mapController.move(position, 18);
                                    mapController.rotateAroundPoint(26);
                                  },
                                ));
                          },
                          viewOnChanged: (val) {},
                          viewOnSubmitted: (val) async {
                            if (val.isNotEmpty) {
                              address.value = <PlaceModel>[];
                              searchController.text = "";
                              List<PlaceModel> addressList =
                                  await getAddressByName(val);
                              address.value = addressList;
                              searchController.text = val;
                            }
                          },
                          textInputAction: TextInputAction.search,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () async {
                              final position = await getCurrentPosition();

                              markets.clear();
                              markets.add(Market(
                                  name: "location",
                                  location: LatLng(
                                      position.latitude, position.longitude)));
                              PlaceModel cs = await getAddressFromCoordinates(
                                  position.latitude, position.longitude);
                              selectedValue.value = cs;
                              searchController.text = cs.displayName ?? '';
                              address.value = [];
                              mapController.move(
                                  LatLng(position.latitude, position.longitude),
                                  18);

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
                              print(
                                  'this is the selected value ${selectedValue.value}');
                              widget.onChange(selectedValue.value);
                            },
                            disable: selectedValue.value.lon == null,
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

  Future<PlaceModel> getAddressFromCoordinates(double lat, double lon) async {
    EasyLoading.show();
    final url = Uri.parse('https://nominatim.openstreetmap.org/reverse');
    final params = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'format': 'json',
    };

    final headers = {
      'User-Agent': 'com.form.parking.violation v0.5',
    };

    try {
      final response = await http.get(url.replace(queryParameters: params),
          headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        print(data);
        final address = data['address']?.toString();
        if (address != null) {
          print(data);
          return PlaceModel.fromJson(data);
        } else {
          return Future.error('No address found in response');
        }
      } else {
        throw Exception('Failed to fetch address: ${response.statusCode}');
      }
    } catch (error) {
      print(error);
      rethrow; // Re-throw the error for further handling
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<List<PlaceModel>> getAddressByName(String searchText) async {
    EasyLoading.show();
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse('https://nominatim.openstreetmap.org/search');
    final params = {
      'q': searchText,
      'limit': '20',
      'format': 'json',
    };

    final headers = {
      'User-Agent': 'com.form.parking.violation v0.5',
    };

    try {
      final response = await http.get(url.replace(queryParameters: params),
          headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        if (data.isNotEmpty) {
          List<PlaceModel> address = data
              .map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
              .toList();
          return address;
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to fetch address: ${response.statusCode}');
      }
    } catch (error) {
      print(error);
      rethrow; // Re-throw the error for further handling
    } finally {
      EasyLoading.dismiss();
      setState(() {
        isLoading = false;
      });
    }
  }

  void addPosition(LatLng ll) {
    markets.clear();
    markets.add(Market(name: "you", location: ll));
    mapController.move(ll, 18);
    mapController.rotateAroundPoint(26);
  }
}
