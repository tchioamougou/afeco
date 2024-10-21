import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/order_model.dart';
import 'package:afeco/app/data/services/cinet_pay_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class OfferDetailsController extends GetxController {
  Rx<BagRelation?> bag = Rx<BagRelation?>(null);
  RxBool loading = false.obs;
  Map<String, String> times = {};
  RxInt selectQuantity = 1.obs;
  final SaveFoodAppWriteController _appWriteController = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    EasyLoading.show();
    loadData();
    super.onInit();
  }

  void loadData() {
    bag.value = Get.arguments as BagRelation;
    times =
        Utils.formatDates(bag.value!.pickupDateStart, bag.value!.pickupDateEnd);
    loading.value = false;
    EasyLoading.dismiss();
  }

  Future<void> createOrder() async {
    await EasyLoading.show();

    try {
      OrderModel om = OrderModel(
          status: OrderStatus.payed.name,
          documentId: "",
          bags: bag.value!.documentId,
          price: bag.value!.price,
          quantity: selectQuantity.value,
          unitePrice: bag.value!.price,
          users: UserService.instance.user!.documentId);
      bool isError = await CinetPayService.handleCinetPayPayment(
          om.price * om.quantity, 'Description');

      if (isError) {
        Get.showSnackbar(
          GetSnackBar(
            title: 'Payment failled',
            message:
                'We\'re sorry, but your payment could not be processed at this time. Please check your payment details and try again. If the problem persists, please contact our customer support for assistance.',
            icon: const Icon(Icons.error),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      } else {
        await _appWriteController.createDocument(
            AppWriteCollection.bagOrderCollections, om.toJson());
        await _appWriteController.updateDocument(
            AppWriteCollection.bagsCollections,
            bag.value!.documentId,
            {'rest': (bag.value!.rest - selectQuantity.value)});
        Get.offAllNamed(AppRoutes.TANKING);
      }
    } catch (e) {
      EasyLoading.showError("An Error Occur");
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
