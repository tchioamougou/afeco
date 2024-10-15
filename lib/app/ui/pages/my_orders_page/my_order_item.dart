import 'package:afeco/app/data/models/order_model.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderItem extends StatelessWidget {
  OrderShowModel osm;
  MyOrderItem({super.key, required this.osm});

  @override
  Widget build(BuildContext context) {
    Map<String, String> times = {};
    times = Utils.formatDates(
      osm.bags.pickupDateStart,
      osm.bags.pickupDateEnd,
    );
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.OFFER_DETAILS, arguments: osm.bags);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Constants.defaultHeaderColor, width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/image/save_food.png',
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(osm.bags.name,style: TextStyle(color: Constants.defaultHeaderColor, fontWeight: FontWeight.w900, fontSize: 18)),
                    SizedBox(height: 5,),
                    Text(osm.bags.stores.businessName),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text('XAF ${osm.unitePrice}', style: TextStyle(color: Constants.defaultHeaderColor, fontWeight: FontWeight.w900),),
                        SizedBox(width: 10,),
                        Text('x ${osm.quantity}'),
                        SizedBox(width: 20,),
                        Text('XAF ${osm.price}', style: TextStyle(color: Constants.defaultHeaderColor, fontWeight: FontWeight.w900),),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.lock_clock,
                  size: 20,
                  color: Constants.buttonColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Pick up: ${times['time']}',
                ),
                SizedBox(
                  width: 5,
                ),
                Tag(
                  content: '${times['day']}',
                  color: Colors.white,
                  backgroundColor: Constants.defaultHeaderColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
