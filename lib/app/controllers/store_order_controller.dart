
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/order_model.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
class StoreOrderController extends GetxController {
  final SaveFoodAppWriteController _appWriteController = Get.find();
  RxList<OrderShowModel> bags = <OrderShowModel>[].obs;


  @override
  void onInit() {
    // TODO: implement
    getOrders();
    super.onInit();
  }


  Future<void> getOrders() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.bagOrderCollections, []);
      bags.value =
          dls.documents.map((e) => OrderShowModel.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}