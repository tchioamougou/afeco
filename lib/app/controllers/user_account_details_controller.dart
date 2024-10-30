
import 'package:afeco/app/data/models/user_model.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:get/get.dart';
class UserAccountDetailsController extends GetxController {
  Rx<UserModel> us = UserService.instance.user!.obs;
  void refreshUser(){
    us.value = UserService.instance.user!;
  }
}