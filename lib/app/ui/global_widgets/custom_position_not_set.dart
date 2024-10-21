import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_location_choose.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomPositionNotSet extends StatelessWidget {
  const CustomPositionNotSet({super.key});

  @override
  Widget build(BuildContext context) {
   int distance = 0;
   LatLng posi = LatLng(0, 0);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  'assets/image/position.png',
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Nessuna posizione selectionata',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Constants.defaultBorderColor,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text('facci sapere dove vorresti salvare cibo invenduto',
                    style: TextStyle()),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: CustomButton(onPressed: (){
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => CustomLocationChoose(onChange: (onPositionChanged) async{
                        await GlobalService.updateUserLocation(posi, distance);
                        Get.back();
                      }, onClose: (){
                        Get.back();
                      }, onChangeRange: (int ) {
                        distance=int;
                      },),
                    );

                  }, text: 'Scegli la posizione', backgroundColor: Constants.buttonColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
