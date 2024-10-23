import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/data/models/market.dart';
import 'package:afeco/app/data/models/place_model.dart';
import 'package:afeco/app/data/services/find_in_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class FindAroundController extends GetxController {
  final Rx<LatLng> _center = const LatLng(51.509364, -0.128928).obs;
  LatLng get center => _center.value;
  set center(LatLng value) => _center.value = value;

  final RxDouble _zoom = 18.0.obs;
  double get zoom => _zoom.value;
  set zoom(double value) => _zoom.value = value;

  List<Market> markets = <Market>[].obs;
  final MapController mapController = MapController();
  RxString position = 'Your current poistion'.obs;

  /// initialise Location variable
  final _geolocatorPlatform = GeolocatorPlatform.instance;
  Rx<Position?> _currentPosition = Rx<Position?>(null);
  Rx<PlaceModel> currentPlace =  FindInService.instance.findIn.obs;
  Position? get currentPosition => _currentPosition.value;
  @override
  void onInit() async {
    // TODO: implement onInit
    if(currentPlace.value.lon!=null && currentPlace.value.lon!.isNotEmpty){
      _center.value =  LatLng(double.parse(currentPlace.value.lat??'0.0'), double.parse(currentPlace.value.lon??'0.0'));
    }
    getCurrentPosition();

    super.onInit();
  }

  // this function is used to move use to the details of the shop
  void goToShop() {}

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

  void findShop(double latitude, double longitude) async {}

  void updateUserPosition(PlaceModel pl)async{
    EasyLoading.show();
    try{
      FindInService.instance.findIn = pl;
      currentPlace.value =pl;
      await GlobalService.updateUserLocation(LatLng(double.parse(pl.lat??'0.0'), double.parse(pl.lon??'0.0')),pl.distance??2);
      mapController.move(LatLng(double.parse(pl.lat??'0.0'), double.parse(pl.lon??'0.0')), 18);
    }catch(e){
      //
    }
    finally{
      EasyLoading.dismiss();
    }
  }

}
