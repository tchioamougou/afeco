import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/place_model.dart';
import 'package:afeco/app/data/services/find_in_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OffersController extends GetxController {
  final SaveFoodAppWriteController _appWriteController = Get.find();
  RxList<BagRelation> bags = <BagRelation>[].obs;
  RxList<BagRelation> searchBags = <BagRelation>[].obs;
  TextEditingController searchController = TextEditingController();
  RxBool isSearching = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSearchError = false.obs;
  Future<void> getBags() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.bagsCollections, []);
      bags.value =
          dls.documents.map((e) => BagRelation.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
// this functions is used to find food by the name of the store
  Future<void> getSearchBags() async {
    EasyLoading.show();
    isLoading.value = true;
    isSearchError.value = false;
    try {
      PlaceModel pl = FindInService.instance.findIn;
      Map<String, double> maxMin = Utils.maxAndMin(
          LatLng(double.parse(pl.lat ?? '0.0'), double.parse(pl.lon ?? '0.0')),
          pl.distance ?? 2);
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.bagsCollections, [
        Query.equal('status', BagStatus.available.name),
        Query.between('storesLat', maxMin['minLat'], maxMin['maxLat']),
        Query.between(
          'storesLong',
          maxMin['minLong'],
          maxMin['maxLong'],
        ),
        Query.contains('storesName', searchController.value.text)
      ]);
      searchBags.value =
          dls.documents.map((e) => BagRelation.fromJson(e.data)).toList();
    } catch (e) {
      isSearchError.value = true;
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }
}
