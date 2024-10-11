import 'package:afeco/app/data/models/giving_package.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSaveFoodNeighbourdhoodItem extends StatelessWidget {
   final GivingPackage gp;

  const CustomSaveFoodNeighbourdhoodItem ({
    super.key,

    required this.gp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
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
                    'https://noahhelps.org/wp-content/uploads/2021/03/March_Meal-Prep-1030x515.jpeg',
                    width: MediaQuery.sizeOf(context).width*0.5,
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
                          gp.address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Collect today: ${gp.availableDateStart} - ${gp.availableDateEnd}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
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
                                  '200 m',
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
