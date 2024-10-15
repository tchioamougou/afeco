import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomCardItem extends StatelessWidget {
  final BagRelation bg;
  const CustomCardItem({
    super.key,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String> times =
        Utils.formatDates(bg.pickupDateStart, bg.pickupDateEnd);
    LatLng point1;
    if (SessionService.instance.isStore()) {
      point1 = LatLng(
          StoreService.instance.store!.lat, StoreService.instance.store!.long);
    } else {
      point1 = LatLng(
          UserService.instance.user!.lat, UserService.instance.user!.long);
    }
    LatLng point2 = LatLng(bg.stores.lat, bg.stores.long);
    String distance = Utils.distanceToText(point1, point2);
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.OFFER_DETAILS, arguments: bg );
      },
      child: Card(
        elevation: 1,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
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
                      'https://www.rockmatsu.org/wp-content/uploads/2022/03/The-boy-who.png',
                      width: MediaQuery.sizeOf(context).width,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          false ? Icons.favorite : Icons.favorite_border,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      )
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(300)),
                                child: Image.network(
                                  'https://www.rockmatsu.org/wp-content/uploads/2022/03/The-boy-who.png',
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                bg.stores.businessName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Positioned(
                      top: 10,
                      left: 5,
                      child: Tag(
                        backgroundColor: Constants.buttonColor.withOpacity(0.2),
                        color: Colors.yellow,
                        content: '${bg.rest} left',
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bg.name
                            ,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Pick up:',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Tag(content: '${times['day']}', color: Colors.white, backgroundColor: Constants.buttonColor),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '${times['time']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Constants.defaultHeaderColor),
                                  const Text('5.0'),
                                  const SizedBox(width: 8),
                                  Text('${distance}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "XAF ${bg.price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: Constants.defaultHeaderColor),
                                  ),
                                  const SizedBox(width: 8),
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
