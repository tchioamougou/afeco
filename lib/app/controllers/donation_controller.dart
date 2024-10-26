import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/donation_model.dart';
import 'package:afeco/app/data/models/food_bank_model.dart';
import 'package:afeco/app/data/services/cinet_pay_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/data/stripe/stripe_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  RxBool loading = false.obs;
  RxDouble price = 1000.0.obs;
  RxList<FoodBankModel> foodBanks = <FoodBankModel>[].obs;
  Rx<FoodBankModel?> selectFoodBand = Rx<FoodBankModel?>(null);
  final SaveFoodAppWriteController _appWriteController = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    getBank();
    super.onInit();
  }

  Future<void> stripePay() async {
    try {
      dynamic result = await StripeService.createPaymentSheep(price.value);
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            // Set to true for custom flow or keep it false
            customFlow: false,
            // Main params
            merchantDisplayName: 'Save Food Donation',
            paymentIntentClientSecret: result['paymentIntent'],
            //setupIntentClientSecret: result['setupIntent'],
            // Customer keys
            customerEphemeralKeySecret: result['ephemeralKey'],
            customerId: result['customer'],
            style: ThemeMode.system,
            appearance: PaymentSheetAppearance(
                colors: PaymentSheetAppearanceColors(
                    primary: Constants.buttonColor))),
      );
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
      await saveDonation();
    } catch (e) {
      print('Errorrrrrr ${e}');
    }
  }

  Future<void> donateNow() async {
    await stripePay();
  }

  Future<void> mobilePayment() async {
    bool isError = await CinetPayService.handleCinetPayPayment(
        price.value.toInt(), 'Description');
    if (isError) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'paymentFailed'.tr,
          message: 'paymentFailedMessage'.tr,
          icon: const Icon(Icons.error),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    } else {
      Get.back();
    }
  }

  Future<void> saveDonation() async {
    await EasyLoading.show();
    try {
      DonationModel dm = DonationModel(
          documentId: '',
          users: UserService.instance.user!.documentId,
          foodBanks: selectFoodBand.value!.documentId,
          paymentMode: 'OM',
          amount: price.value,
          paymentReference: 'paymentReference',
          dateDon: DateTime.now());
      await _appWriteController.createDocument(
          AppWriteCollection.donationCollection, dm.toJson());
      Get.offAllNamed(AppRoutes.DONATION_THANKING);
    } catch (e) {
      EasyLoading.showError("An Error Occur");
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getBank() async {
    EasyLoading.show();
    try {
      DocumentList dls = await _appWriteController
          .getDocuments(AppWriteCollection.foodBankCollection, []);
      foodBanks.value =
          dls.documents.map((e) => FoodBankModel.fromJson(e.data)).toList();
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
