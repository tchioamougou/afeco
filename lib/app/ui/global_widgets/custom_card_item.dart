import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomCardItem extends StatefulWidget {
  final BagRelation bg;
  final double? width;
  const CustomCardItem({super.key, required this.bg, this.width});

  @override
  State<CustomCardItem> createState() => _CustomCardItemState();
}

class _CustomCardItemState extends State<CustomCardItem> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> times =
        Utils.formatDates(widget.bg.pickupDateStart, widget.bg.pickupDateEnd);
    LatLng point1;
    bool like = false;
    if (SessionService.instance.isStore()) {
      point1 = LatLng(
          StoreService.instance.store!.lat, StoreService.instance.store!.long);
    } else {
      point1 = LatLng(
          UserService.instance.user!.lat, UserService.instance.user!.long);
      like =  UserService.instance.user!.storesLiked.contains(widget.bg.stores.documentId);
    }
    LatLng point2 = LatLng(widget.bg.stores.lat, widget.bg.stores.long);
    String distance = Utils.distanceToText(point1, point2);
    bool isSoldOut = widget.bg.status==BagStatus.soldOut.name;
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.OFFER_DETAILS, arguments: widget.bg);
      },
      child: Card(
        elevation: 5,
        shadowColor: Constants.defaultHeaderColor.withOpacity(0.4),
        child: Container(
          width:
              MediaQuery.sizeOf(context).width * (widget.width != null ? widget.width! : 0.7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isSoldOut?Colors.grey.withOpacity(0.2):Colors.white,
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
                      Utils.imageLoader(widget.bg.stores.profileCoverId),
                      width: MediaQuery.sizeOf(context).width,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                       visualDensity: VisualDensity.compact,
                       style: IconButton.styleFrom(
                         backgroundColor:Colors.transparent.withOpacity(0.4)
                       ),
                        icon:  Icon(
                          like ? FontAwesomeIcons.solidHeart : Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () async {

                          EasyLoading.show();
                         await GlobalService.updateUserLikes(widget.bg.stores.documentId);
                          setState(() {
                            like = !like;
                          });
                          EasyLoading.dismiss();
                        },
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
                                
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(300)),
                                child: Image.network(
                                  Utils.imageLoader(widget.bg.stores.profileLogoId),
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                widget.bg.stores.businessName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )),
                  if(widget.bg.status==BagStatus.soldOut.name)
                    Positioned(
                        top: 10,
                        left: 5,
                        child: Tag(
                          backgroundColor: Colors.grey,
                          color:Colors.white,
                          content: 'soldOut'.tr,
                        ))
                    else
                  Positioned(
                      top: 10,
                      left: 5,
                      child: Tag(
                        backgroundColor: Colors.yellow,
                        color: Constants.buttonColor,
                        content: '${widget.bg.rest} ${'left'.tr}',
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.bg.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Text(
                                '${"pickUp".tr} ${times['day']}:',
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '${times['time']}',
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 17,
                                      color: Constants.defaultHeaderColor),
                                  const Text(
                                    '5.0',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '|',
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    distance,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Constants.oCameroon.format(widget.bg.price),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
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
