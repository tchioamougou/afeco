import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/giving_package.dart';
import 'package:afeco/app/data/models/place_model.dart';
import 'package:afeco/app/data/services/find_in_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/custom_save_food_neighbourdhood_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  List<Map<String, String>> quickActions = [
    {'title': 'Save food', 'image': "assets/image/foods/healthy-foodview.png"},
    {'title': 'Orders', 'image': "assets/image/foods/grocery.png"},
    {'title': 'C20 Views', 'image': "assets/image/foods/energy.png"},
    {'title': 'Planning', 'image': "assets/image/healthy-food.png"}
  ];
  RxList<GivingPackage> givingPackages = <GivingPackage>[].obs;
  final SaveFoodAppWriteController _appWriteController = Get.find();
  RxList<BagRelation> bags = <BagRelation>[].obs;
  RxList<BagRelation> searchBags = <BagRelation>[].obs;
  RxList<BagRelation> soldOuts = <BagRelation>[].obs;
  TextEditingController searchController = TextEditingController();
  RxBool hasPosition = true.obs;
  RxBool isSearching = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSearchError = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    hasPosition.value = UserService.instance.user != null
        ? (UserService.instance.user!.lat != 0 &&
            UserService.instance.user!.long != 0)
        : true;
    super.onInit();
  }

  Future<void> getBags() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController.getDocuments(
          AppWriteCollection.bagsCollections,
          [Query.equal('status', BagStatus.available.name)]);
      bags.value =
          dls.documents.map((e) => BagRelation.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getBagsSoldOut() async {
    EasyLoading.show();
    try {
      PlaceModel pl = FindInService.instance.findIn;
      Map<String, double> maxMin = Utils.maxAndMin(
          LatLng(double.parse(pl.lat ?? '0.0'), double.parse(pl.lon ?? '0.0')),
          pl.distance ?? 2);
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.bagsCollections, [
        Query.equal('status', BagStatus.soldOut.name),
        Query.between('storesLat', maxMin['minLat'], maxMin['maxLat']),
        Query.between('storesLong', maxMin['minLong'], maxMin['maxLong']),
      ]);
      soldOuts.value =
          dls.documents.map((e) => BagRelation.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getGivingPacks() async {
    EasyLoading.show();
    PlaceModel pl = FindInService.instance.findIn;
    try {
      Map<String, double> maxMin = Utils.maxAndMin(
          LatLng(double.parse(pl.lat ?? '0.0'), double.parse(pl.lon ?? '0.0')),
          pl.distance ?? 2);
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.givingPackagesCollections, [
        Query.between('lat', maxMin['minLat'], maxMin['maxLat']),
        Query.between('long', maxMin['minLong'], maxMin['maxLong']),
        Query.equal('status', GivingPackageStatus.open.name)
      ]);
      givingPackages.value =
          dls.documents.map((e) => GivingPackage.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void viewAll(String title, RxList<BagRelation> bags) {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        isDismissible: false,
        isScrollControlled: true,
        Obx(() => Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Scaffold(
                appBar: CustomAppBar(
                  title: title,
                ),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ...bags.value
                            .map((e) => CustomCardItem(
                                  bg: e,
                                  width: 0.9,
                                ))
                            .toList()
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  void viewAllNei(String title, RxList<GivingPackage> bags) {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        isDismissible: false,
        isScrollControlled: true,
        Obx(() => Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Scaffold(
                appBar: CustomAppBar(
                  title: title,
                ),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ...bags.value
                            .map((e) => CustomSaveFoodNeighbourdhoodItem(
                                  gp: e,
                                  width: 0.9,
                                ))
                            .toList()
                      ],
                    ),
                  ),
                ),
              ),
            )));
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
       // Query.contains('storesName', searchController.value.text)
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
}
