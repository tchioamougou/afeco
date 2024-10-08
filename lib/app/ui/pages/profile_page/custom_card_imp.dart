import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardImp extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const CustomCardImp({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.OFFER_DETAILS);
      },
      child: Card(
        elevation: 30,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Constants.defaultHeaderColor,
                                  fontSize: 23.sp),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                           child: Icon(Icons.access_time_rounded, size: 50,color: Constants.buttonColor,),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Text(
                              description,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Constants.defaultHeaderColor,
                                  fontSize: 25.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
