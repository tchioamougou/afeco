import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class AccountDetailsController extends GetxController {
  Future<bool> inviteFriend() async {
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
}
