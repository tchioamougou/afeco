import 'package:afeco/app/ui/global_widgets/custom_filter.dart';
import 'package:afeco/app/ui/global_widgets/header_custom.dart';
import 'package:afeco/app/ui/pages/offers_page/custom_offer_item.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/offers_controller.dart';

class OffersPage extends StatefulWidget {
      const OffersPage ({Key? key}) : super(key: key);

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  OffersController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    controller.getBags();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child:Obx(()=> Scaffold(
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
                            Get.dialog(CustomFilter(onClose: () {
                              Get.back();
                            },onPress: (){
                              Get.back();
                            },));
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
                children:  controller.bags.value.map(
                        (i) =>CustomOfferItem(bg: i,
                    )).toList(),

              ),

            ],
          ),),
        ),)
      );
  }
}
