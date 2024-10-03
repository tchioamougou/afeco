import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderCustom extends StatelessWidget {
  const HeaderCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BIENVENUE,'.tr,
                style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold, fontFamily: 'poppins-light',color: Constants.defaultHeaderColor),
              ),
              SizedBox(height: 05.h,),
              Text(
                'Styves',
                style: TextStyle(fontSize: 19.sp,fontFamily: 'poppins-semi-bold'),
              ),
              SizedBox(height: 5.h,),

            ],
          ),
        ),
        Expanded(
          flex: 5,
          child:Column(
            children: [
              Container(
                width: 200.w,
                child:  Text(
                  'Thank you for continue saving our planet',
                  style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Constants.defaultHeaderColor,fontFamily: 'poppins-light'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
