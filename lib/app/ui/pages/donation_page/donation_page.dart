import 'package:afeco/app/data/models/food_bank_model.dart';
import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/donation_controller.dart';

class DonationPage extends GetView<DonationController> {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
          //backgroundColor: Colors.,
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
                              height: 160,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/image/donate.jpeg',
                                        fit: BoxFit.fitWidth,
                                        height: 150,
                                        width: MediaQuery.sizeOf(context).width,
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 20, 5, 5),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            child: Image.asset(
                                              'assets/image/img.png',
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Support a local charity',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Save Food is collaboration with charities and non-profits in yiur area to help those most in need. you can support an organisation close to you by making a donation rigth here in the app',
                                    style: GoogleFonts.roboto(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ...controller.foodBanks.value
                                      .map((i) => FoodBankCard(
                                            donation: i,
                                            isSelected: i.documentId ==
                                                controller
                                                    .selectFoodBand.value?.documentId,
                                            onSelected: (f) {
                                              controller.selectFoodBand.value = f;
                                            },
                                          ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (!controller.loading.value)
                    Positioned(
                        bottom: 0,
                        child: Column(
                          children: [
                            CustomBottomAction(
                                onPressed: () {
                                  if(controller.selectFoodBand.value!=null) {
                                    Get.bottomSheet(Obx(() => Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10)),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Icon(Icons.arrow_back)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  child: Image.asset(
                                                    'assets/image/img.png',
                                                    height: 50,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300),
                                                ),
                                                ClipRRect(
                                                  child: Image.network(
                                                    Utils.imageLoader(controller.selectFoodBand.value!.profileId),
                                                    height: 50,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      300),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('${controller.selectFoodBand.value!.name}',
                                                    style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Divider(),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Donation Amount"
                                                .toUpperCase()),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomFilterBtn(
                                                    title: '1000',
                                                    isSelected: controller
                                                            .price.value ==
                                                        1000.00,
                                                    onChange: (val) {
                                                      controller.price.value =
                                                          1000.00;
                                                    }),
                                                CustomFilterBtn(
                                                    title: '2000',
                                                    isSelected: controller
                                                            .price.value ==
                                                        2000.00,
                                                    onChange: (val) {
                                                      controller.price.value =
                                                          2000.00;
                                                    }),
                                                CustomFilterBtn(
                                                    title: '3000',
                                                    isSelected: controller
                                                            .price.value ==
                                                        3000.00,
                                                    onChange: (val) {
                                                      controller.price.value =
                                                          3000.00;
                                                    })
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Payment method'.toUpperCase(),
                                              style: GoogleFonts.roboto(),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  //  Get.back();
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      color: Constants
                                                          .defaultHeaderColor,
                                                    ),
                                                    Text(
                                                      'Select a payment method',
                                                      style: TextStyle(
                                                          color: Constants
                                                              .defaultHeaderColor,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    )
                                                  ],
                                                )),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Total'.toUpperCase(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                    '${controller.price.value}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            CustomButton(
                                                onPressed: () {
                                                  controller.donateNow();
                                                },
                                                text: 'Donate Now',
                                                backgroundColor: Constants
                                                    .defaultBorderColor)
                                          ],
                                        ),
                                      )));
                                  }
                                },
                                text: 'Donate',
                                backgroundColor: Constants.buttonColor)
                          ],
                        ))
                ],
              ))),
    );
  }
}

class CustomFilterBtn extends StatefulWidget {
  double? maxHeight;
  String title;
  bool isSelected;
  Icon? icon;
  Function(bool val) onChange;
  CustomFilterBtn(
      {super.key,
      this.maxHeight,
      required this.title,
      this.isSelected = false,
      required this.onChange,
      this.icon});

  @override
  State<CustomFilterBtn> createState() => _CustomFilterBtnState();
}

class _CustomFilterBtnState extends State<CustomFilterBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.maxHeight,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            color: widget.isSelected ? Constants.buttonColor : Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Constants.defaultBorderColor)),
        constraints: BoxConstraints(
            maxHeight:
                widget.maxHeight ?? MediaQuery.sizeOf(context).width * 0.5),
        child: InkWell(
            onTap: () {
              setState(() {
                widget.isSelected = !widget.isSelected;
                widget.onChange(widget.isSelected);
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) widget.icon!,
                Text(
                  'XAF ${widget.title}',
                  style: TextStyle(
                      color: widget.isSelected
                          ? Colors.white
                          : Constants.buttonColor),
                ),
              ],
            )));
  }
}

class FoodBankCard extends StatefulWidget {
  final FoodBankModel
      donation; // Assuming 'Donation' class from previous response
  final bool isSelected;
  final Function(FoodBankModel) onSelected;
  const FoodBankCard(
      {Key? key,
      required this.donation,
      required this.isSelected,
      required this.onSelected})
      : super(key: key);

  @override
  State<FoodBankCard> createState() => _FoodBankCardState();
}

class _FoodBankCardState extends State<FoodBankCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main card with tap detection
        GestureDetector(
          onTap: () {
            setState(() {
              //_isSelected = !_isSelected; // Toggle selection state
              widget.onSelected(widget.donation);
            });
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Card(
              color: widget.isSelected
                  ? Constants.defaultHeaderColor
                  : Color.fromRGBO(220, 238, 247, 1), // Change color on tap
              elevation: 1,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.95,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.donation.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 17,
                        color: widget.isSelected
                            ? Colors.white
                            : Colors.black, // Change text color on tap
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.donation.description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: widget.isSelected
                            ? Colors.white70
                            : Colors.black54, // Change text color on tap
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: MediaQuery.sizeOf(context).width * 0.45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/image/img.png',
                  height: 30,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: MediaQuery.sizeOf(context).width * 0.38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  Utils.imageLoader(widget.donation.profileId),
                  height: 30,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
