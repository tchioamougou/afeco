import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOfferItem extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String price;
  final String imageUrl;
  final bool isFavorite;

  const CustomOfferItem({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
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
          width: MediaQuery.sizeOf(context).width * 0.91,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      imageUrl,
                      width: MediaQuery.sizeOf(context).width,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      left: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(300)),
                                child: Image.network(
                                  imageUrl,
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            description,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'Collect today: $time',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                price,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Constants.defaultHeaderColor),
                                  Text('5.0'),
                                  SizedBox(width: 4),
                                  Text('|',style: TextStyle(fontSize: 20),),
                                  SizedBox(width: 4),
                                  Text('200m'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    price,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                        color: Constants.defaultHeaderColor),
                                  ),
                                  SizedBox(width: 8),
                                ],
                              ),
                            ],
                          )
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
