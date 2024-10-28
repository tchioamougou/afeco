import 'dart:convert';

import 'package:afeco/app/data/appwrite/appwrite_controllers.dart';
import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/user_model.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

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
    UserModel us = UserService.instance.user!;
    if (us.storesLiked.contains(store)) {
      us.storesLiked.remove(store);
      action = 'unLike';
    } else {
      us.storesLiked.add(store);
      action = 'like';
    }
    Document dc = await _appWriteController.updateDocument(
        AppWriteCollection.userCollections,
        UserService.instance.user!.documentId, {
      "storesLiked": us.storesLiked,
    });
    UserService.instance.user = UserModel.fromJson(dc.data);

    /// after that
    await updateStoresLikes(store, action);
  }

  static Future<void> updateStoresLikes(String storeId, String action) async {
    final url = Uri.https('6711c129c34a0ce00e30.appwrite.global','likes');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "storeId": storeId,
          "action": action,
          // "userId": 1,
        }));
    print('this is the response ${response.reasonPhrase}');
    if (response.statusCode == 201) {
    } else {
      print(response);
    }
  }

  static Future<bool> inviteFriend() async {
    final files = <XFile>[];
    final data = await rootBundle.load('assets/image/save_food.png');
    final buffer = data.buffer;
    files.add(
      XFile.fromData(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        name: 'flutter_logo.png',
        mimeType: 'image/png',
      ),
    );
    dynamic shareResult = await Share.shareXFiles(
      files,
      subject: "shareToSave".tr,
      text: "shareToSaveMessage".tr,
    );
    return shareResult.status == ShareResultStatus.success;
  }

  static Future<void> updateUserNotification() async {
    Document dc = await _appWriteController.updateDocument(
        AppWriteCollection.userCollections,
        UserService.instance.user!.documentId, {
      "isEmailNotificationsEnabled":
          UserService.instance.user!.isEmailNotificationsEnabled,
      "isCalendarRemindersEnabled":
          UserService.instance.user!.isCalendarRemindersEnabled,
      "isImportantUpdatesEnabled":
          UserService.instance.user!.isImportantUpdatesEnabled,
      "isPushNotification": UserService.instance.user!.isPushNotification,
      "isAnnouncementsEnabled":
          UserService.instance.user!.isAnnouncementsEnabled,
      "reminderDays": UserService.instance.user!.reminderDays,
    });
    UserService.instance.user = UserModel.fromJson(dc.data);
  }

  static Future<void> shareBag(BagRelation osm)async {
      final files = <XFile>[];
      final data = await rootBundle.load('assets/image/gifs/charity.gif');
      final buffer = data.buffer;
      files.add(
        XFile.fromData(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          name: 'flutter_logo.png',
          mimeType: 'image/png',
        ),
      );
       await Share.shareXFiles(
        files,
        subject:osm.name ,
        text: "shareToSaveMessage".tr,
      );
  }
}
