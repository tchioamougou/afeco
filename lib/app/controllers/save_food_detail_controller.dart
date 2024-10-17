
import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/giving_package.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
class SaveFoodDetailController extends GetxController {
  final SaveFoodAppWriteController _appWriteController = Get.find();
  Rx<GivingPackage?> gp = Rx<GivingPackage?>(null);
  Map<String, String> times = {};
  RxBool loading = false.obs;
  RxBool reserved = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    EasyLoading.show();
    loadData();
    super.onInit();
  }

  void loadData(){
    gp.value =  Get.arguments as GivingPackage;
    reserved.value =( gp.value!.status ==GivingPackageStatus.reserved.name);
    times =
        Utils.formatDates(gp.value!.availableDateStart, gp.value!.availableDateEnd);
    loading.value = false;
    EasyLoading.dismiss();
  }

  Future<void> reserve ()async{
     EasyLoading.show();
     try{
       print(gp.value!.documentId,);
      await _appWriteController.updateDocument(AppWriteCollection.givingPackagesCollections, gp.value!.documentId,
           {
             "status":GivingPackageStatus.reserved.name,
             "reservedBy":UserService.instance.user!.documentId
           });
     }catch(e){
       print(e);
     }finally{
       EasyLoading.dismiss();
     }
  }
}