import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardItem extends StatelessWidget {
  final BagRelation bg;
  const CustomCardItem({
    Key? key,
    required this.bg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.OFFER_DETAILS);
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
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               IconButton(
                                 icon: Icon(
                                   false ? Icons.favorite : Icons.favorite_border,
                                   color: Colors.red,
                                 ),
                                 onPressed: (){},
                               ),
                             ],
                           ),
                         ],
                       )),
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
                                   'https://www.rockmatsu.org/wp-content/uploads/2022/03/The-boy-who.png',
                                   width: 35,
                                   height: 35,
                                   fit: BoxFit.cover,
                                 ),
                               ),
                               Text(
                                 bg.name,
                                 style: const TextStyle(
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
                             bg.stores.businessName,
                             style: const TextStyle(
                                 fontSize: 14, fontWeight: FontWeight.bold),
                           ),
                           SizedBox(
                             height: 3.h,
                           ),
                           Text(
                             'Collect today: ${bg.pickupDateStart}',
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
                                   Icon(Icons.star,
                                       color: Constants.defaultHeaderColor),
                                   const Text('5.0'),
                                   const SizedBox(width: 8),
                                   const Text('200m'),
                                 ],
                               ),
                               Row(
                                 children: [
                                   Text(
                                     "${bg.price}",
                                     style: TextStyle(
                                         fontWeight: FontWeight.w900,
                                         fontSize: 20,
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
