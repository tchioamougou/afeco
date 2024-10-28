import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/order_model.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/appwrite.dart';
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
    try {
      DocumentList dls = await _appWriteController.getDocuments(
          AppWriteCollection.bagOrderCollections,
          [Query.equal('store', StoreService.instance.store!.documentId)]);
      bags.value =
          dls.documents.map((e) => OrderShowModel.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<void> confirmOrder(
      Map<String, dynamic> data, OrderShowModel osm) async {
    String orderId = data['orderId'] as String;
    String storeId = data['storeId'] as String;
    String userId = data['userId'] as String;
    if (storeId == StoreService.instance.store?.documentId &&
        orderId == osm.documentId) {
      EasyLoading.show();
      try {
        /*await _appWriteController.updateDocument(
            AppWriteCollection.bagOrderCollections,
            orderId,
            {"status": OrderStatus.closed.name});*/
        await _appWriteController.confirmOrder(
            {'orderId': orderId, 'storeId': storeId, "userId": userId});
        Get.toNamed(AppRoutes.TANKING);
      } catch (e) {
        print(e);
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      EasyLoading.showError('You information does not match well');
    }
  }
}
