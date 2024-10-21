import 'package:afeco/app/data/services/cinet_pay_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  RxBool loading = false.obs;
  RxDouble price = 1000.0.obs;

  Future<void> donateNow() async {
    bool isError =
        await CinetPayService.handleCinetPayPayment(price.value, 'Description');
    if (isError) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Payment failled',
          message:
          'We\'re sorry, but your donation could not be processed at this time. Please check your payment details and try again. If the problem persists, please contact our customer support for assistance.',
          icon: const Icon(Icons.error),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }else{
      Get.back();
    }

  }
}
