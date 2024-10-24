import 'dart:convert';

import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/user_model.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

SaveFoodAppWriteController _appWriteController = Get.find();

class GlobalService extends GetxService {
  /// this function is used to User Location
  static Future<void> updateUserLocation(LatLng pos, int distance) async {
    Document dc = await _appWriteController.updateDocument(
        AppWriteCollection.userCollections,
        UserService.instance.user!.documentId,
        {"long": pos.longitude, "lat": pos.latitude, "distance": distance});
    UserService.instance.user = UserModel.fromJson(dc.data);
  }

  static Future<void> updateUserLikes(String store) async {
    String action;
    if (UserService.instance.user!.storesLiked.contains(store)) {
      UserService.instance.user!.storesLiked.remove(store);
      action = 'unLike';
    } else {
      UserService.instance.user!.storesLiked.add(store);
      action = 'like';
    }
    Document dc = await _appWriteController.updateDocument(
        AppWriteCollection.userCollections,
        UserService.instance.user!.documentId, {
      "storesLiked": UserService.instance.user!.storesLiked,
    });
    UserService.instance.user = UserModel.fromJson(dc.data);

    /// after that
    await updateStoresLikes(store, action);
  }

  static Future<void> updateStoresLikes(String storeId, String action) async {
    final url = Uri.parse('http://6711c129c34a0ce00e30.appwrite.global');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "storeId": storeId,
          "action": action,
          // "userId": 1,
        }));
      print('this is the response ${response.reasonPhrase}');
    if (response.statusCode == 201) {
    } else {}
  }
}
