
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/giving_package.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
class StoreHomeController extends GetxController {

  RxList<BagRelation> bags = <BagRelation>[].obs;
  SaveFoodAppWriteController _appWriteController = Get.find();

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
      print('bags $bags.value');
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}