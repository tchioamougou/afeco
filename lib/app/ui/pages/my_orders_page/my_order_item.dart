import 'dart:convert';

import 'package:afeco/app/data/models/order_model.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:huawei_scan/huawei_scan.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../controllers/store_order_controller.dart';

class MyOrderItem extends StatelessWidget {
  OrderShowModel osm;
  MyOrderItem({super.key, required this.osm});
  late final StoreOrderController _orderController;

  @override
  Widget build(BuildContext context) {
    Map<String, String> times = {};
    times = Utils.formatDates(
      osm.bags.pickupDateStart,
      osm.bags.pickupDateEnd,
    );
    bool isStore = false;
    if(StoreService.instance.store!=null){
      isStore = true;
      _orderController= Get.find();
    }

    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.OFFER_DETAILS, arguments: osm.bags);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Constants.defaultHeaderColor, width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          Utils.imageLoader(osm.bags.stores.profileCoverId),
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(osm.bags.name,style: TextStyle(color: Constants.defaultHeaderColor, fontWeight: FontWeight.w900, fontSize: 18)),
                    SizedBox(height: 5,),
                    Text(osm.bags.stores.businessName),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('XAF ${osm.unitePrice}', style: TextStyle(color: Constants.defaultHeaderColor, fontWeight: FontWeight.w900),),
                        SizedBox(width: 10,),
                        Text('x ${osm.quantity}'),
                        SizedBox(width: 20,),
                        Text('XAF ${osm.price * osm.quantity}', style: TextStyle(color: Constants.defaultHeaderColor, fontWeight: FontWeight.w900),),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.lock_clock,
                  size: 20,
                  color: Constants.buttonColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${"pickUp".tr}: ${times['time']}',
                ),
                SizedBox(
                  width: 5,
                ),
                Tag(
                  content: '${times['day']}',
                  color: Colors.white,
                  backgroundColor: Constants.defaultHeaderColor,
                ),
              ],
            ),
            SizedBox(height: 10,),
            if(isStore)
              CustomButton(onPressed: (){
                // here is to try to get the user information package
                scanQR();
              }, text: 'checkout'.tr, backgroundColor: Constants.buttonColor)
            else

            CustomButton(onPressed: (){
              // here is to try to get the user information package
              Get.defaultDialog(
                title: 'Scan the QRCode',
                titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.defaultHeaderColor),
                content:Column(
                  children: [
                    Text("When the store scan This QRCODE That means to recieved the package", textAlign: TextAlign.center,),
                   SizedBox(height: 10,),
                   Container(
                     height: 400,
                     width: 250,
                     child:  QrImageView(
                       data: jsonEncode({'orderId':osm.documentId,"storeId":osm.bags.stores.documentId}),
                       version: QrVersions.auto,
                       size: 200.0,
                       //embeddedImage: AssetImage("assets/image/save_food.png"),
                     ),
                   )
                  ],
                ),
                actions: [
                  CustomButton(onPressed: (){
                    Get.back();
                  }, text: 'Confirm', backgroundColor: Constants.buttonColor),
                  CustomButton(onPressed: (){
                    Get.back();
                  }, text: 'Back', backgroundColor: Constants.buttonColor)
                ]

              );
            }, text: 'collectNow'.tr, backgroundColor: Constants.buttonColor)
          ],
        ),
      ),
    );
  }


  Future<void> scanQR() async {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if(androidInfo.manufacturer=="HUAWEI"){
      await HmsCustomizedView.
      startCustomizedView(
        CustomizedViewRequest(
          scanType: HmsScanTypes.AllScanType,
          continuouslyScan: false,
          isFlashAvailable: true,
          flashOnLightChange: false,
          enableReturnBitmap: false,
          customizedCameraListener: (ScanResponse response) async{
            pause();
            print('result_search');
          await  _orderController.confirmOrder(json.decode(response.showResult!), osm);
            print('result_search');
            print(response.showResult);
            resume();
          },
          customizedLifeCycleListener: (CustomizedViewEvent lifecycleStatus) {
            debugPrint('Customized View LifeCycle Listener: $lifecycleStatus');
          },
        ),
      );
    }else{
      String barcodeScanRes;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);

        Map<String,String> details = jsonDecode(barcodeScanRes);
        _orderController.confirmOrder(details, osm);
        print(barcodeScanRes);
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }
    }
  }

  void resume() async {
    try {
      await HmsCustomizedView.resumeScan();
    } on PlatformException catch (e) {
      if (e.code == HmsScanErrors.remoteViewError.errorCode) {
        debugPrint(HmsScanErrors.remoteViewError.errorMessage);
      }
    }
  }

  void pause() async {
    try {
      await HmsCustomizedView.pauseScan();
    } on PlatformException catch (e) {
      if (e.code == HmsScanErrors.remoteViewError.errorCode) {
        debugPrint(HmsScanErrors.remoteViewError.errorMessage);
      }
    }
  }
}
