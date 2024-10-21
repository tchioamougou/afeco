import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/giving_package.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/custom_save_food_neighbourdhood_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Map<String, String>> quickActions = [
    {'title': 'Save food', 'image': "assets/image/save_food.png"},
    {'title': 'Orders', 'image': "assets/image/offer.png"},
    {'title': 'C20 Views', 'image': "assets/image/planet.png"},
    {'title': 'Planning', 'image': "assets/image/healthy-food.png"}
  ];
  RxList<GivingPackage> givingPackages = <GivingPackage>[].obs;
  SaveFoodAppWriteController _appWriteController = Get.find();
  RxList<BagRelation> bags = <BagRelation>[].obs;
  RxBool hasPosition = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    hasPosition.value = UserService.instance.user != null
        ? (UserService.instance.user!.lat != 0 &&
            UserService.instance.user!.long != 0)
        : true;
    print(UserService.instance.user!.toJson());
    super.onInit();
  }

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

  Future<void> getGivingPacks() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.givingPackagesCollections, []);
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
                        ...bags.value.map((e) => CustomCardItem(bg: e,width: 0.9,)).toList()
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
                    SizedBox(
                      height: 20,
                    ),
                    ...bags.value.map((e) => CustomSaveFoodNeighbourdhoodItem( gp: e,width: 0.9,)).toList()
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
