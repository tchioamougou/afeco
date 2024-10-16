import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/pages/profile_page/custom_liststyle.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/store_profile_controller.dart';

class StoreProfilePage extends GetView<StoreProfileController> {
  const StoreProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        if(controller.store.value!=null && controller.store.value!.profileCoverId.isNotEmpty)
                          Image.network(
                            Utils.imageLoader(controller.store.value!.profileCoverId),
                            fit: BoxFit.fitWidth,
                            height: 200,
                            width: MediaQuery.sizeOf(context).width,
                          )
                          else
                        Image.asset(
                          'assets/image/offer.png',
                          fit: BoxFit.fitWidth,
                          height: 200,
                          width: MediaQuery.sizeOf(context).width,
                        )
                      ],
                    ),
                    Positioned(
                        bottom: 10,
                        left: 20,
                        child: InkWell(
                          onTap: (){
                            controller.openFileLogo();
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                border: Border.all(
                                    color: Constants.defaultBorderColor, width: 1)),
                            child: 
                            
                            Column(
                              children: [
                                if(controller.store.value!=null && controller.store.value!.profileLogoId.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(300),
                                    child: Image.network(
                                      Utils.imageLoader(controller.store.value!.profileLogoId, ),
                                      height: 65,
                                      width: 60,
                                    ),
                                  )
                                else
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: Image.asset(
                                    'assets/image/planet.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        onPressed: () async {
                        controller.openFile();
                        },
                        icon: const FaIcon(FontAwesomeIcons.photoFilm,size: 25, color: Colors.white,),

                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  CustomListStile(title: 'Account Details', icon: FontAwesomeIcons.user, onPress: (){
                    Get.toNamed(AppRoutes.ACCOUNT_DETAILS);
                  }),
                  CustomListStile(title: 'Actions History', icon: FontAwesomeIcons.history, onPress: (){}),
                  CustomListStile(title: 'Help Centers', icon: FontAwesomeIcons.message, onPress: (){}),
                  CustomListStile(title: 'Invite Friends', icon: FontAwesomeIcons.facebookF, onPress: (){}),
                  CustomListStile(title: 'Privacy', icon: FontAwesomeIcons.keybase, onPress: (){})
                ],
              ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
