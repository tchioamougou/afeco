
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/store_model.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
class StoreDetailController extends GetxController {
  Rx<StoreModel?> store = Rx<StoreModel?>(null);
  final SaveFoodAppWriteController _appWriteController = Get.find();
  RxList<BagRelation> bags = <BagRelation>[].obs;
  RxBool like = false.obs;
  RxBool isLoading = false.obs;
  RxString  distance ="".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    isLoading.value = true;
    loadData();
    if (UserService.instance.user != null) {
      like.value = UserService.instance.user!.storesLiked
          .contains(store.value!.documentId);
    }
    getBags();
    super.onInit();
  }

  void loadData() {
    store.value = Get.arguments as StoreModel;
    isLoading.value = false;
    /// calculate the distance from the store
    LatLng point1 = LatLng(
    UserService.instance.user!.lat, UserService.instance.user!.long);
    LatLng point2 = LatLng(store.value!.lat,store.value!.long);
     distance.value = Utils.distanceToText(point1, point2);
  }
  Future<void> getBags() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController.getDocuments(
          AppWriteCollection.bagsCollections,
          [
            Query.equal('status', BagStatus.available.name),
            Query.equal('stores', store.value!.documentId)
          ]);
      bags.value =
          dls.documents.map((e) => BagRelation.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}