import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/store_model.dart';
import 'package:afeco/app/data/services/image_service.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class StoreProfileController extends GetxController {
  final ImageService imageService = ImageService();
  final SaveFoodAppWriteController _appWriteController = Get.find();
  final Rx<StoreModel?> store = StoreService.instance.store.obs;
  Future<void> openFile() async {
    try {
      final file = await imageService.pickImageFromGallery();
      if (file != null) {
        EasyLoading.show();
        String id = await _appWriteController.createFile(file.path,
            '${StoreService.instance.store!.businessName.trim().removeAllWhitespace}_cover');
        if (StoreService.instance.store!.profileCoverId.isNotEmpty) {
          await _appWriteController
              .deleteFile(StoreService.instance.store!.profileCoverId);
        }
        Document dc = await _appWriteController.updateDocument(
            AppWriteCollection.storeCollections,
            StoreService.instance.store!.documentId,
            {'profileCoverId': id});
        StoreService.instance.store = StoreModel.fromJson(dc.data);
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> openFileLogo() async {
    try {
      final file = await imageService.pickImageFromGallery();
      if (file != null) {
        EasyLoading.show();
        String id = await _appWriteController.createFile(file.path,
            '${StoreService.instance.store!.businessName.trim().removeAllWhitespace}_profile');
        if (StoreService.instance.store!.profileLogoId.isNotEmpty) {
          await _appWriteController
              .deleteFile(StoreService.instance.store!.profileLogoId);
        }
        Document dc = await _appWriteController.updateDocument(
            AppWriteCollection.storeCollections,
            StoreService.instance.store!.documentId,
            {'profileLogoId': id});
        StoreService.instance.store = StoreModel.fromJson(dc.data);
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
