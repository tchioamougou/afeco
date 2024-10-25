import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProfileHeader extends StatefulWidget {
  CustomProfileHeader({super.key});

  @override
  State<CustomProfileHeader> createState() => _HeaderCustomState();
}

class _HeaderCustomState extends State<CustomProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Constants.defaultHeaderColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.dialog(
                  barrierDismissible: false,
                  AlertDialog(
                    backgroundColor: Constants.buttonColor,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    content: Container(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  border: Border.all(
                                      color: Constants.defaultBorderColor,
                                      width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(300),
                                child: Image.asset(
                                  'assets/image/avatars/happy.png',
                                ),
                              ),
                            ),
                            onTap: () {
                              //widget.image = 'assets/image/avatars/happy.png';
                              setState(() {});
                            },
                          ),
                          InkWell(
                            onTap: () {
                              //  widget.image = 'assets/image/avatars/happy-face.png';
                              setState(() {});
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  border: Border.all(
                                      color: Constants.defaultBorderColor,
                                      width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(300),
                                child: Image.asset(
                                  'assets/image/avatars/happy-face.png',
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // widget.image = 'assets/image/avatars/smile.png';
                              setState(() {});
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  border: Border.all(
                                      color: Constants.defaultBorderColor,
                                      width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(300),
                                child: Image.asset(
                                  'assets/image/avatars/smile.png',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  border: Border.all(
                      color: Constants.defaultBorderColor, width: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.asset(
                  Constants.defaultImage,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hi!,${UserService.instance.user!.name}'.tr,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins-light',
                          color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  width: 200.w,
                  child: Text(
                    'letSaveFoodToday'.tr,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'poppins-light'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.ACCOUNT_DETAILS);
                      },
                      icon: Icon(Icons.settings,color: Colors.white,),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.defaultBorderColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 13)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
