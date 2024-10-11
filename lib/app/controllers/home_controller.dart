import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/giving_package.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Map<String, String>> quickActions = [
    {'title': 'Save food', 'image': "assets/image/save_food.png"},
    {'title': 'Offers', 'image': "assets/image/offer.png"},
    {'title': 'C20 Views', 'image': "assets/image/planet.png"},
    {'title': 'Planning', 'image': "assets/image/meal_planning.jpeg"}
  ];
  RxList<GivingPackage> givingPackages = <GivingPackage>[].obs;
  SaveFoodAppWriteController _appWriteController = Get.find();
  RxList<BagRelation> bags = <BagRelation>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getBags() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.bagsCollections, []);
      bags.value = dls.documents.map((e)=>BagRelation.fromJson(e.data)).toList();
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
      givingPackages.value = dls.documents.map((e)=>GivingPackage.fromJson(e.data)).toList();
   } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
