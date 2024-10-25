import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShareApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.97,
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Constants.buttonColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "inviteFriendTitle".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Text(
                            "inviteFriendMessage".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              bool shared =
                              await GlobalService.inviteFriend();
                              if (shared) {
                                Get.snackbar('youAreHero'.tr,
                                    'togetherAgainst'.tr);
                              }
                            },
                            child: Text('inviteFriends'.tr)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/image/save_food.png',
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}