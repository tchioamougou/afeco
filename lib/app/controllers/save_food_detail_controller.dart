
import 'package:afeco/app/data/models/giving_package.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
class SaveFoodDetailController extends GetxController {
  Rx<GivingPackage?> gp = Rx<GivingPackage?>(null);
  RxBool loading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    EasyLoading.show();
    loadData();
    super.onInit();
  }

  void loadData(){
    gp.value =  Get.arguments as GivingPackage;
    loading.value = false;
    EasyLoading.dismiss();
  }
}