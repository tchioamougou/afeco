import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/data/services/find_in_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_location_choose.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomPositionNotSet extends StatelessWidget {
  final VoidCallback refresh;
  const CustomPositionNotSet({super.key, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  'assets/image/position.png',
                  height: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('noPositionSet'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Constants.defaultBorderColor,
                    )),
                const SizedBox(
                  height: 10,
                ),
                 Text('noPositionSetDescription'.tr,
                    style: const TextStyle()),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: CustomButton(onPressed: (){
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => CustomLocationChoose(onChange: (onPositionChanged) async{
                        EasyLoading.show();
                       try{
                         FindInService.instance.findIn = onPositionChanged;
                         await GlobalService.updateUserLocation(LatLng(double.parse(onPositionChanged.lat!), double.parse(onPositionChanged.lon!)), onPositionChanged.distance??0);
                         refresh();
                         Get.back();
                       }catch(e){
                         print(e);
                       }finally{
                         EasyLoading.dismiss();
                       }
                      }, onClose: (){
                        Get.back();
                      },),
                    );

                  }, text: 'chooseLocation'.tr, backgroundColor: Constants.buttonColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
