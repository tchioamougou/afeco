import 'package:afeco/app/ui/global_widgets/header_custom.dart';
import 'package:afeco/app/ui/pages/offers_page/custom_offer_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/offers_controller.dart';

class OffersPage extends GetView<OffersController> {
      const OffersPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Scaffold(
          body:SingleChildScrollView(child:
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: HeaderCustom(),
              ),
              const SizedBox(height: 20,),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.1, color: Constants.defaultBorderColor),
                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.search,
                            color: Constants.buttonColor,
                            size: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.67,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "search here",
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.sliders,
                            color: Constants.buttonColor,
                            size: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    10,
                        (i) => const Column(
                          children: [
                            SizedBox(height: 10,),
                            CustomOfferItem(
                              title: 'Penelope\'s',
                              description: 'Baked goods',
                              time: '17:40 - 18:00',
                              price: '£12.00',
                              imageUrl:'https://dovv-distribution.com/wp-content/uploads/2023/09/Djino-1-768x768.jpg',
                              isFavorite: true,
                            )
                          ],
                        )),
              )

            ],
          ),),
        ),
      );
  }
}
