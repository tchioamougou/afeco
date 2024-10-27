import 'package:afeco/app/ui/global_widgets/cinetpays/cinet_pay_checkout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CinetPayService extends GetxService {
  static Future<void> handleCinetPayPayment(
    int amount,
    String description,
  {required Function(Map<String,dynamic>) waitResponse,
    required Function(Map<String,dynamic>) onError,}
  ) async {
    await Get.to(() => CinetPayCheckout(
        title: 'Save Food',
        titleStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        titleBackgroundColor: Constants.defaultHeaderColor,
        configData: <String, dynamic>{
          'apikey': Constants.cinetApiKey,
          'site_id': int.parse(Constants.cinetSiteId!),
          'notify_url': Constants.cinetNotifyUrl,
          "type": "MOBILE"
        },
        paymentData: <String, dynamic>{
          'transaction_id': Utils.generateTransactionID(),
          'amount': 1000,
          'currency': 'XAF',
          'channels': 'ALL',
          'description': 'information abpit idr'
        },
        waitResponse: (response) {
        },
        onError: (error) {
          Get.back();
        }));
  }
}
