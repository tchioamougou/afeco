import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/order_model.dart';
import 'package:afeco/app/data/models/user_model.dart';
import 'package:afeco/app/data/services/cinet_pay_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/data/stripe/stripe_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class OfferDetailsController extends GetxController {
  Rx<BagRelation?> bag = Rx<BagRelation?>(null);
  RxBool loading = false.obs;
  Map<String, String> times = {};
  RxInt selectQuantity = 1.obs;
  RxString selectPaymentMethod = "".obs;
  final SaveFoodAppWriteController _appWriteController = Get.find();
  RxBool like = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    EasyLoading.show();
    loadData();
    if(UserService.instance.user!=null){
      like.value =  UserService.instance.user!.storesLiked.contains(bag.value!.stores.documentId);
    }

    super.onInit();
  }

  void loadData() {
    bag.value = Get.arguments as BagRelation;
    times =
        Utils.formatDates(bag.value!.pickupDateStart, bag.value!.pickupDateEnd);
    loading.value = false;
    EasyLoading.dismiss();
  }

  Future<void> payNow() async {
    if (selectPaymentMethod.value == SelectPaymentMethod.creditCard.name) {
      await stripePay();
    } else if (selectPaymentMethod.value == SelectPaymentMethod.mobile.name) {
      await cinetPay();
    }
  }

  Future<void> stripePay() async {
    try {
      EasyLoading.show();
      UserModel us = UserService.instance.user!;
      dynamic result = await StripeService.createPaymentSheep(
          selectQuantity.value * bag.value!.price);
      PaymentSheetPaymentOption? value = await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            // Set to true for custom flow or keep it false
            customFlow: false,
            // Main params
            merchantDisplayName: bag.value!.name,
            paymentIntentClientSecret: result['paymentIntent'],

            //setupIntentClientSecret: result['setupIntent'],
            // Customer keys
            customerEphemeralKeySecret: result['ephemeralKey'],
            customerId: result['customer'],
            billingDetails: BillingDetails(
              name: us.name,
              email: us.email,
            ),
            style: ThemeMode.system,
            appearance: PaymentSheetAppearance(
                colors: PaymentSheetAppearanceColors(
                    primary: Constants.buttonColor))),
      );
      EasyLoading.dismiss();
      await Stripe.instance.presentPaymentSheet();
      dynamic paymentItem =
          await StripeService.getPaymentItemStatus(result['paymentIntentId']);
      print(paymentItem.toString());
      await createOrder(paymentItem['id'],double.parse( '${paymentItem['amount']}'));
    } catch (e) {
      print('error$e');
      EasyLoading.dismiss();
    }
  }

  Future<void> cinetPay() async {
    try {
      await CinetPayService.handleCinetPayPayment(
          (selectQuantity.value * bag.value!.price).toInt(), 'Description',
          onError: (val) {
            Get.showSnackbar(
              GetSnackBar(
                title: 'paymentFailed'.tr,
                message: 'paymentFailedMessage'.tr,
                icon: const Icon(Icons.error),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 5),
              ),
            );
          }, waitResponse: (response) {
        createOrder(response['transaction_id'], double.parse('${response['amount']}'));
      });

    } catch (e) {
      print(e);
    }
  }

  Future<void> createOrder(String transactionId, double amount) async {
    try {
      OrderModel om = OrderModel(
          status: OrderStatus.payed.name,
          documentId: "",
          bags: bag.value!.documentId,
          price: bag.value!.price,
          quantity: selectQuantity.value,
          unitePrice: bag.value!.price,
          users: UserService.instance.user!.documentId);
      await EasyLoading.show();
      await _appWriteController.createDocument(
          AppWriteCollection.bagOrderCollections, om.toJson());

      /// here wa have to calculate the items elements remaining and if it's zero change status to sold out.
      int res = (bag.value!.rest - selectQuantity.value);
      await _appWriteController.updateDocument(
          AppWriteCollection.bagsCollections, bag.value!.documentId, {
        'rest': res,
        "status": res == 0 ? BagStatus.soldOut.name : bag.value!.status
      });
      Get.offAllNamed(AppRoutes.TANKING);
    } catch (e) {
      EasyLoading.showError("An Error Occur");
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
