import 'package:afeco/app/data/models/market.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/services.dart';

class MapPageController extends GetxController {
  final Rx<LatLng> _center = const LatLng(0,0).obs;
  LatLng get center => _center.value;
  set center(LatLng value) => _center.value = value;


  final RxDouble _zoom = 15.0.obs;
  double get zoom => _zoom.value;
  set zoom(double value) => _zoom.value = value;

  List<Market> markets =<Market>[].obs;
  List<String> withinOptions =  [ '500 m', '1 Km', '2 km', '3 km'];
  final MapController mapController = MapController();
  RxString position = 'Your current poistion'.obs;
  RxString within = '2 Km'.obs;
  RxInt distance =0.obs;
  /// initialise Location variable
  final _geolocatorPlatform = GeolocatorPlatform.instance;
  Rx<Position?> _currentPosition = Rx<Position?>(null);

  Position? get currentPosition => _currentPosition.value;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  // this function is used to move use to the details of the shop
  void goToShop(){

  }

  Future<dynamic> getCurrentPosition() async {
    try {
      final hasPermission =
      await _geolocatorPlatform.isLocationServiceEnabled();
      if (!hasPermission) {
        return Future.error('Location services are disabled.');
      }
      LocationPermission permission =
      await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied.');
      }
      final position = await _geolocatorPlatform.getCurrentPosition();
      _center.value = LatLng(position.latitude, position.longitude);
      markets.add(Market(name: 'location', location: _center.value));
      findShop(_center.value.latitude, _center.value.longitude);
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
  void findShop(double latitude, double longitude) async {

  }

}
