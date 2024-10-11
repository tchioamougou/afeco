
import 'dart:convert';

import 'package:afeco/app/data/models/option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class CreateAccountController extends GetxController {
  RxList<Option> typeBusiness = <Option>[].obs;
  Rx<TextEditingController> businessController = TextEditingController().obs;
  Future<List<Option>> readJsonData() async {
    final String jsonString = await rootBundle.loadString('assets/data/type_business.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return Option.fromJsonList(jsonList);
  }

  @override
  void onInit() async {
   typeBusiness.value = await readJsonData();
    super.onInit();
  }
}