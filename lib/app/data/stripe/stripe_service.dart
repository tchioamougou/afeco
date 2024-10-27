import 'dart:convert';

import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

SaveFoodAppWriteController _appWriteController = Get.find();

class StripeService extends GetxService {
  static Future<Map<String, dynamic>> createPaymentSheep(double amount) async {
    final url = Uri.https('671cd02121e33273d582.appwrite.global','/payment-sheet');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "amount": amount,
          "currency": 'xaf',
          // "userId": 1,
        }));
    if (response.statusCode == 201||response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
     return Future.error(response.body);
    }
  }
  static Future<Map<String, dynamic>> getPaymentItemStatus(String id) async {
    final url = Uri.https('671cd02121e33273d582.appwrite.global','/payment_intents');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          // "userId": 1,
        }));
    if (response.statusCode == 201||response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      return Future.error(response.body);
    }
  }
}
