import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/global_widgets/time_left.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/offer_details_controller.dart';

class OfferDetailsPage extends GetView<OfferDetailsController> {
  const OfferDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(height: MediaQuery.sizeOf(context).height,child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/image/6_bnkz5f8.jpg',
                              fit: BoxFit.fitWidth,
                              height: 200,
                              width: MediaQuery.sizeOf(context).width,
                            )
                          ],
                        ),
                        Positioned(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5, 30, 5, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const FaIcon(Icons.arrow_back_ios_new),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.white.withOpacity(0.6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 9)),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const FaIcon(Icons.share),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          Colors.white.withOpacity(0.6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 9)),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const FaIcon(Icons.favorite_border),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          Colors.white.withOpacity(0.6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 9)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: Tag(content: 'Eding soom',color: Colors.red, backgroundColor: Colors.red.shade200,),
                        ),
                        Positioned(
                            bottom: 10,
                            left: 10,
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(300),
                                      border: Border.all(
                                          color: Constants.defaultBorderColor,
                                          width: 1)),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      'assets/image/planet.png',
                                    ),
                                    borderRadius: BorderRadius.circular(300),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Tchop yamo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 20,
                                  color: Constants.buttonColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Surprise Bag',
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_outlined,
                                  size: 20,
                                  color: Constants.buttonColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '4.9',
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '(41)',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
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
                                  'Pick up: 11:00 AM - 11:30 AM',
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Tag(content: 'Content', color: Colors.white, backgroundColor:Constants.defaultHeaderColor,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '45\$',
                              style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                            Text(
                              '12\$',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Constants.defaultHeaderColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Constants.buttonColor.withOpacity(0.3),
                                width: 1),
                            bottom: BorderSide(
                                color: Constants.buttonColor.withOpacity(0.3),
                                width: 1))),
                    child: ListTile(
                      onTap: () {},
                      leading: FaIcon(
                        Icons.location_on_outlined,
                        color: Constants.buttonColor,
                      ),
                      title: Text(
                        'Yaounde - maison damas',
                        style: TextStyle(
                            color: Constants.defaultHeaderColor, fontSize: 17),
                      ),
                      subtitle: Text('More information about the store'),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Constants.buttonColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What you could get',
                          textAlign: TextAlign.left,
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/image/save_food.png",
                              height: 100,
                            ),
                            Expanded(
                                child: Text(
                                    "It's a surprise! When you buy a Suprise Bag, il will be filled with the delicious food that the store has left at the end of the day."))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Constants.buttonColor.withOpacity(0.3),
                                width: 1),
                            bottom: BorderSide(
                                color: Constants.buttonColor.withOpacity(0.3),
                                width: 1))),
                    child: ListTile(
                      dense: true,
                      onTap: () {},
                      leading: FaIcon(
                        Icons.location_on_outlined,
                        color: Constants.buttonColor,
                      ),
                      title: Text(
                        "Ingredients & allergens",
                        style: TextStyle(
                            color: Constants.defaultHeaderColor, fontSize: 17),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Constants.buttonColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What others pleople are saying',
                          textAlign: TextAlign.left,
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),),
            Positioned(
                bottom: 0,
                child:
                    Column(
                      children: [
                        TimeLeft(targetDate: DateTime.now().add(Duration(hours: 1))),
                        CustomBottomAction(onPressed: (){
                          Get.toNamed(AppRoutes.TANKING);
                        }, text: 'Reserve', backgroundColor:  Constants.buttonColor)
                      ],
                    )
               )
          ],
        )

      ),
      /*Positioned(
        top: 55,
        left: 70,
        child: Container(
          height: 250,
          width: 250,
          child: ClipRRect(
            child: Image.network(
                'https://image.made-in-china.com/202f0j00mkHVMhqWZvYE/Custom-Eco-Friendly-Biodegradable-Brown-Fast-Food-to-Go-Delivery-Paper-Bag-Restaurant-Takeout-Packaging-Take-Away-Kraft-Paper-Bag.webp'),
            borderRadius: const BorderRadius.all(Radius.circular(300)),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              color: Colors.grey.shade100,
              border: Border.all(
                  width: 4, color: Constants.defaultBorderColor)),
        ),
      ),
      ,*/
    );
  }
}
