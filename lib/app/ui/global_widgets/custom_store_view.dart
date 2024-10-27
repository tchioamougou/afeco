import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/data/models/store_model.dart';
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

class CustomStoreView extends StatefulWidget {
  final StoreModel store;
  final double? width;
  const CustomStoreView({super.key, required this.store, this.width});

  @override
  State<CustomStoreView> createState() => _CustomStoreViewState();
}

class _CustomStoreViewState extends State<CustomStoreView> {
  @override
  Widget build(BuildContext context) {
    LatLng point1;
    bool like = false;
    if (SessionService.instance.isStore()) {
      point1 = LatLng(
          StoreService.instance.store!.lat, StoreService.instance.store!.long);
    } else {
      point1 = LatLng(
          UserService.instance.user!.lat, UserService.instance.user!.long);
      like =  UserService.instance.user!.storesLiked.contains(widget.store.documentId);
    }
    LatLng point2 = LatLng(widget.store.lat, widget.store.long);
    String distance = Utils.distanceToText(point1, point2);
    return InkWell(
      onTap: () {
      },
      child: Card(
        elevation: 5,
        shadowColor: Constants.defaultHeaderColor.withOpacity(0.4),
        child: Container(
          width:
          MediaQuery.sizeOf(context).width * (widget.width != null ? widget.width! : 0.7),
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
                      Utils.imageLoader(widget.store.profileCoverId),
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
                          await GlobalService.updateUserLikes(widget.store.documentId);
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
                                  Utils.imageLoader(widget.store.profileLogoId),
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                widget.store.businessName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )),
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
                                    style: const TextStyle(
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
