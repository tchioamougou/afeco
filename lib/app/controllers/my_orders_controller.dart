import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/order_model.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  final SaveFoodAppWriteController _appWriteController = Get.find();
  RxList<OrderShowModel> bags = <OrderShowModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  @override
  void onInit() {
    // TODO: implement
    getOrders();
    super.onInit();
  }

  Future<void> getOrders() async {
    EasyLoading.show();
    isLoading.value =true;
    try {
      DocumentList dls = await _appWriteController.getDocuments(
          AppWriteCollection.bagOrderCollections,
          [Query.notEqual("status", OrderStatus.closed.name)]);
      bags.value =
          dls.documents.map((e) => OrderShowModel.fromJson(e.data)).toList();
      isError.value = false;
    } catch (e) {
      isError.value = true;
      print(e);
    } finally {
      isLoading.value =false;
      EasyLoading.dismiss();
    }
  }
}
