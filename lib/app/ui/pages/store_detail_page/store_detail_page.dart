import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/global_widgets/position_display.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/store_detail_controller.dart';

class StoreDetailPage extends GetView<StoreDetailController> {
      const StoreDetailPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
          backgroundColor: Constants.defaultBackGround,
          body: Obx(() => Stack(
            children: [
              if (!controller.isLoading.value)
                SizedBox(
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
                                    Utils.imageLoader(controller
                                        .store.value!.profileCoverId),
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
                                          Icons.arrow_back_ios_new,
                                          color: Colors.white,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors
                                                .transparent
                                                .withOpacity(0.4),
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
                                            onPressed: () async {
                                              controller.like.value =
                                              !controller.like.value;
                                              await GlobalService
                                                  .updateUserLikes(
                                                  controller
                                                      .store
                                                      .value!
                                                      .documentId);
                                            },
                                            icon: FaIcon(
                                              controller.like.value
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: Colors.white,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors
                                                    .transparent
                                                    .withOpacity(0.4),
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
                                          borderRadius:
                                          BorderRadius.circular(300),
                                          child: Image.network(
                                            Utils.imageLoader(controller
                                                .store
                                                .value!
                                                .profileLogoId),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.store.value!.businessName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                           Text(
                                            '${controller.distance.value}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white60,
                                                fontSize: 16),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                             color: Colors.white,
                              border: Border(
                                  top: BorderSide(
                                      color: Constants.buttonColor
                                          .withOpacity(0.3),
                                      width: 1),
                                  /*bottom: BorderSide(
                                      color: Constants.buttonColor
                                          .withOpacity(0.3),
                                      width: 1)*/)),
                          child: ListTile(
                            dense: true,
                            onTap: () {},
                            leading: FaIcon(
                              Icons.location_on_outlined,
                              color: Constants.buttonColor,
                            ),
                            title: Text(
                              '${controller.store.value?.streetNameNumber}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Constants.defaultHeaderColor,
                                  fontSize: 14),
                            ),
                            subtitle: Text('howToGetHere'.tr),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: Constants.buttonColor,
                            ),
                          ),
                        ),
                       const SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                               child:  Text(
                                 'bagFromStore'.tr,
                                 textAlign: TextAlign.left,
                                 style: const TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.w900),
                               ),),
                                const SizedBox(
                                  height: 15,
                                ),
                                ...controller.bags.map((i){
                                 Map<String, dynamic> times =
                                      Utils.formatDates(i.pickupDateStart, i.pickupDateEnd);
                                  return ListTile(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.OFFER_DETAILS,arguments: i);
                                    },
                                    title: Text(i.name,style: const TextStyle(fontWeight: FontWeight.w900),) ,
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5.h,),
                                        Text('${"${times['day']}".tr} ${times['time']}'),
                                        SizedBox(height: 5.h,),
                                        Text(Constants.oCameroon.format(i.price), style: TextStyle(fontWeight: FontWeight.w900, color: Constants.defaultHeaderColor),)
                                      ],
                                    ),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(400),
                                      child: Image.network(Utils.imageLoader(i.stores.profileCoverId), height: 55,width: 55,),
                                    ),
                                    trailing: Icon(Icons.chevron_right, color: Constants.defaultBorderColor,),
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'othersInfo'.tr,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                 Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Container(
                                       width: MediaQuery.sizeOf(context).width*0.47,
                                       child: Column(
                                         children: [
                                           Icon(Icons.cake_outlined,size: 50,color: Constants.defaultHeaderColor,),
                                           SizedBox(height: 10.h,),
                                           Tag(content: '${Utils.calculateSince(controller.store.value!.createdDate)}', color:Colors.black87, backgroundColor:  Colors.grey.shade200),
                                           SizedBox(height: 10.h,),
                                           Text('ofFighting'.tr, style: TextStyle(fontWeight: FontWeight.w700),),
                                         ],
                                       ),
                                     ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width*0.47,
                                      child:  Column(
                                        children: [
                                          Icon(Icons.shopping_bag_outlined,size: 50,color: Constants.defaultHeaderColor,),
                                          SizedBox(height: 10.h,),
                                          Tag(content: '10000+', color:Colors.black87, backgroundColor:  Colors.grey.shade200),
                                          SizedBox(height: 10.h,),
                                          Text('bagSaved'.tr, style: TextStyle(fontWeight: FontWeight.w700),),
                                        ],
                                      ),
                                    )
                                   ],
                                 )
                                ],
                              ),
                            )),
                        const SizedBox(height: 10,),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [Label(title: 'address'.tr),
                              PositionDisplay(
                                height: 200,
                                  pos: LatLng(controller.store.value!.lat,
                                      controller.store.value!.long),
                                  title: "here".tr)],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

            ],
          ))),
    );
  }
}
