import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

SaveFoodAppWriteController _appWriteController = Get.find();

class GlobalService extends GetxService{

  /// this function is used to User Location
  static Future<void> updateUserLocation(LatLng pos) async {
    Document dc = await _appWriteController.updateDocument(AppWriteCollection.userCollections, UserService.instance.user!.documentId, {
      "long":pos.longitude,
      "lat":pos.latitude
    });

    print(dc.data);
  }
}