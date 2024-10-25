
import 'package:afeco/app/data/models/user_model.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:get/get.dart';
class UserAccountDetailsController extends GetxController {
  UserModel us = UserService.instance.user!;
}