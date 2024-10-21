import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CinetPayService extends GetxService {
  static Future<bool> handleCinetPayPayment(
    double amount,
    String description,
  ) async {
    bool isError = true;
    print("Constants.cinetApiKey ${Constants.cinetApiKey}");
    await Get.to(() => CinetPayCheckout(
        title: 'Save Food',
        titleStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        titleBackgroundColor: Constants.defaultHeaderColor,
        configData: <String, dynamic>{
          'apikey': Constants.cinetApiKey,
          'site_id': int.parse(Constants.cinetSiteId ?? '0'),
          'notify_url': Constants.cinetNotifyUrl
        },
        paymentData: <String, dynamic>{
          'transaction_id': Utils.generateTransactionID(),
          'amount': amount,
          'currency': 'XAF',
          'channels': 'ALL',
          'description': description
        },
        waitResponse: (response) {
          isError = false;
          print('this is the response: $response');
        },
        onError: (error) {
          print('error $error');
          isError = true;
          Get.back();
        }));
    return isError;
  }
}
