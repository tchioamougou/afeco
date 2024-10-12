import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class OfferDetailsController extends GetxController {
  Rx<BagRelation?> bag = Rx<BagRelation?>(null);
  RxBool loading = false.obs;
  Map<String, String> times = {};
  RxInt selectQuantity = 1.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    EasyLoading.show();
    loadData();
    super.onInit();
  }

  void loadData() {
    bag.value = Get.arguments as BagRelation;
    times =
        Utils.formatDates(bag.value!.pickupDateStart, bag.value!.pickupDateEnd);
    loading.value = false;
    EasyLoading.dismiss();
  }
}
