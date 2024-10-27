import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderCustom extends StatefulWidget {
  final Icon icon;
  final VoidCallback onPress;
  String? image;
  HeaderCustom(
      {super.key, required this.icon, required this.onPress, this.image});

  @override
  State<HeaderCustom> createState() => _HeaderCustomState();
}

class _HeaderCustomState extends State<HeaderCustom> {

  @override
  Widget build(BuildContext context) {
    return Row(
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
                            widget.image = 'assets/image/avatars/happy.png';
                            setState(() {});
                          },
                        ),
                        InkWell(
                          onTap: () {
                            widget.image =
                                'assets/image/avatars/happy-face.png';
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
                            widget.image = 'assets/image/avatars/smile.png';
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
                border:
                    Border.all(color: Constants.defaultBorderColor, width: 1)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                widget.image ?? Constants.defaultImage,
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
                        color: Constants.defaultHeaderColor),
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
                      color: Constants.defaultHeaderColor,
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
                  IconButton.outlined(
                    onPressed: widget.onPress,
                    icon: widget.icon,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.defaultBorderColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 13)),
                  ),
                  Positioned(
                      top: 4,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300),
                          color: Colors.white,
                        ),
                        child: Text(
                          '20',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
