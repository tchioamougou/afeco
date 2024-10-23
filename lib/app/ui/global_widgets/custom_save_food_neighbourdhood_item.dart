import 'package:afeco/app/data/models/giving_package.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomSaveFoodNeighbourdhoodItem extends StatelessWidget {
   final GivingPackage gp;
    final double?width;
  const CustomSaveFoodNeighbourdhoodItem ({
    super.key,
  this.width,
    required this.gp,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String> times =Utils.formatDates(gp.availableDateStart, gp.availableDateStart);
    LatLng point1 = LatLng(UserService.instance.user!.lat, UserService.instance.user!.long);
    LatLng point2 = LatLng(gp.lat, gp.long);
    String distance = Utils.distanceToText(point1, point2);
    return Card(
      elevation: 3,
      child: Container(
        width: MediaQuery.sizeOf(context).width * (width!=null ? width!:0.5),
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
                    Utils.imageLoader(gp.imageId),
                    width: MediaQuery.sizeOf(context).width * (width!=null ? width!:0.5),
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gp.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            const Text(
                              'pickUp:',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 4.w,),
                            Text(
                              '${times['day']}',
                              style:  TextStyle(
                                  fontSize: 15,
                                  color: Constants.defaultHeaderColor,
                                  fontWeight: FontWeight.bold
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
                                Text(
                                  distance,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      color: Constants.defaultHeaderColor),
                                ),
                                const SizedBox(width: 8),
                              ],

                            ),
                            IconButton(onPressed: (){
                              Get.toNamed(AppRoutes.SAVE_FOOD_DETAIL,arguments: gp);
                            }, icon: Icon(Icons.add_circle,color: Constants.defaultBorderColor,size: 30,))
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
    );
  }
}
