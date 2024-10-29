import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/no_elements/custom_alert.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/notifications_controller.dart';

class NotificationsPage extends GetView<NotificationsController> {
      const NotificationsPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Scaffold(
          appBar:CustomAppBar(title: 'notifications'.tr,),
          body:
          Obx((){
            if(controller.notifications.isNotEmpty){
              return SingleChildScrollView(
                child: Padding(padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Column(
                    children: List.generate(controller.notifications.length, (i)=>ListTile(
                      onTap: (){},
                      leading: FaIcon(FontAwesomeIcons.bell, color: Constants.buttonColor,),
                      title: Text('Notification $i'),
                      subtitle: Text('This is the message you'),
                    )),
                  ),),
              );
            }else{
              return CustomAlert(image: 'assets/image/angry.png', title: 'No notification', isAction: false,  actionLabel: '', onPress: (){});
            }
          })

        ),
      );
  }
}
