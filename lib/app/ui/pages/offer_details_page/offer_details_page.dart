import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/global_widgets/position_display.dart';
import 'package:afeco/app/ui/global_widgets/quantity_selector.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/global_widgets/time_left.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/offer_details_controller.dart';

class OfferDetailsPage extends GetView<OfferDetailsController> {
  const OfferDetailsPage({super.key});

  void initPayment() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        isDismissible: false,

        Obx(()=>Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment method'.toUpperCase()),
                  TextButton(
                      onPressed: () {
                        //  Get.back();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Constants.defaultHeaderColor,
                          ),
                          Text(
                            'Select a payment method',
                            style: TextStyle(
                                color: Constants.defaultHeaderColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total'.toUpperCase(),
                          style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        Text(
                          '${controller.bag.value!.price * controller.selectQuantity.value}',
                          style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuantitySelector(initialQuantity: 1,minValue: 1, maxValue: controller.bag.value!.rest, onQuantityChanged: (val){
                        controller.selectQuantity.value = val;
                      }),
                      Text('Only ${controller.bag.value!.rest} Left',  style: GoogleFonts.poppins(fontSize: 30, color: Colors.orange,fontWeight: FontWeight.w900),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  CustomButton(
                      onPressed: () {
                        controller.createOrder();
                        Get.back();
                      },
                      text: 'Reserve',
                      backgroundColor: Constants.buttonColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color: Constants.defaultHeaderColor,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.sizeOf(Get.context!).width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('By reserving this meal you agree to Save Food'),
                        TextButton(onPressed: (){}, child: Text('Terms & conditions',style: TextStyle(fontWeight: FontWeight.bold,color: Constants.defaultHeaderColor),))
                      ],
                    ),
                  ))
              
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(() => Stack(
                children: [
                  if (!controller.loading.value)
                    Container(
                      height: MediaQuery.sizeOf(context).height,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Image.network(
                                  Utils.imageLoader(controller.bag.value!.stores.profileCoverId),
                                        fit: BoxFit.fitWidth,
                                        height: 200,
                                        width: MediaQuery.sizeOf(context).width,
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 30, 5, 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: const FaIcon(
                                                Icons.arrow_back_ios_new),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white
                                                    .withOpacity(0.6),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 9)),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const FaIcon(Icons.share),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .white
                                                        .withOpacity(0.6),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 9)),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const FaIcon(
                                                    Icons.favorite_border),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors
                                                        .white
                                                        .withOpacity(0.6),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 9)),
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
                                    child: Tag(
                                      content: 'Ending soon',
                                      color: Colors.red,
                                      backgroundColor: Colors.red.shade200,
                                    ),
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
                                                borderRadius:
                                                    BorderRadius.circular(300),
                                                border: Border.all(
                                                    color: Constants
                                                        .defaultBorderColor,
                                                    width: 1)),
                                            child: ClipRRect(
                                              child: Image.network(
                                                  Utils.imageLoader(controller.bag.value!.stores.profileLogoId),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(300),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            controller
                                                .bag.value!.stores.businessName,
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            controller.bag.value!.name,
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
                                            style:
                                                TextStyle(color: Colors.grey),
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
                                            'Pick up: ${controller.times['time']}',
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Tag(
                                            content:
                                                '${controller.times['day']}',
                                            color: Colors.white,
                                            backgroundColor:
                                                Constants.defaultHeaderColor,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${controller.bag.value!.originalPrice}\$',
                                        style: TextStyle(
                                            fontSize: 15,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        '${controller.bag.value!.price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18,
                                            color:
                                                Constants.defaultHeaderColor),
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
                                          color: Constants.buttonColor
                                              .withOpacity(0.3),
                                          width: 1),
                                      bottom: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0.3),
                                          width: 1))),
                              child: ListTile(
                                onTap: () {},
                                leading: FaIcon(
                                  Icons.location_on_outlined,
                                  color: Constants.buttonColor,
                                ),
                                title: Text(
                                  '${controller.bag.value?.stores.streetNameNumber}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Constants.defaultHeaderColor,
                                      fontSize: 17),
                                ),
                                subtitle:
                                    Text('More information about the store'),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: Constants.buttonColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'What you could get',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
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
                                          color: Constants.buttonColor
                                              .withOpacity(0.3),
                                          width: 1),
                                      bottom: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0.3),
                                          width: 1))),
                              child: ListTile(
                                dense: true,
                                onTap: () {
                                  Get.dialog(
                                      barrierDismissible: false,
                                      AlertDialog(
                                        content: Container(
                                          height: 250,
                                          child: Column(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.bagShopping,
                                                color: Constants.buttonColor,
                                                size: 70,
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "Your surprise Bags is a surprise",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  textAlign: TextAlign.justify,
                                                  "We wish we could tell you what exactly will be in your Surprise Bag - but it's always a surprise! The store wil fill it with a selection of their unsold items. if you have a question abouy allergens or ingredients, please ask to the store."),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          CustomButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              text: 'Got it!',
                                              backgroundColor:
                                                  Constants.buttonColor)
                                        ],
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ));
                                },
                                leading: FaIcon(
                                  Icons.location_on_outlined,
                                  color: Constants.buttonColor,
                                ),
                                title: Text(
                                  "Ingredients & allergens",
                                  style: TextStyle(
                                      color: Constants.defaultHeaderColor,
                                      fontSize: 17),
                                ),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: Constants.buttonColor,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0),
                                          width: 1),
                                      bottom: BorderSide(
                                          color: Constants.buttonColor
                                              .withOpacity(0.15),
                                          width: 1))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'What others pleople are saying',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Constants.buttonColor
                                                .withOpacity(0.3),
                                            width: 1),
                                        bottom: BorderSide(
                                            color: Constants.buttonColor
                                                .withOpacity(0.3),
                                            width: 1))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'What you need to now',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'The store will provide packaging for your food, but we encourage you to bring your own bag to carry it home in'),
                                    ],
                                  ),
                                )),
                            Label(title: 'Address'),
                            PositionDisplay(
                                pos: LatLng(controller.bag.value!.stores.lat,
                                    controller.bag.value!.stores.long),
                                title: "Here")
                          ],
                        ),
                      ),
                    ),
                  if (!controller.loading.value)
                    Positioned(
                        bottom: 0,
                        child: Column(
                          children: [
                            if (controller.bag.value!.pickupDateEnd
                                .isAfter(DateTime.now()))
                              TimeLeft(
                                  targetDate:
                                      controller.bag.value!.pickupDateEnd),
                            CustomBottomAction(
                                onPressed: () {
                                  Get.dialog(
                                      barrierDismissible: false,
                                      AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Label(
                                                title: 'What you have to know')
                                          ],
                                        ),
                                        content: Container(
                                          height: 150,
                                          child: Column(
                                            children: [
                                              Text(
                                                'Your surprise Bags is a surprise',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  textAlign: TextAlign.justify,
                                                  "We wish we could tell you what exactly will be in your Surprise Bag - but it's always a surprise! The store wil fill it with a selection of their unsold items. if you have a question abouy allergens or ingredients, please ask to the store."),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          CustomButton(
                                              onPressed: () {
                                                Get.back();
                                                initPayment();
                                              },
                                              text: 'Got it!',
                                              backgroundColor:
                                                  Constants.buttonColor),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    'Back',
                                                    style: TextStyle(
                                                        color: Constants
                                                            .defaultHeaderColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                            ],
                                          )
                                        ],
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      ));
                                },
                                text: 'Reserve',
                                backgroundColor: Constants.buttonColor)
                          ],
                        ))
                ],
              ))),
    );
  }
}
