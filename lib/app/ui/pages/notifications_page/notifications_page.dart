import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
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
          appBar:AppBar(
              backgroundColor: Constants.defaultHeaderColor,
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.circleArrowLeft,
                        size: 30,
                        color: Colors.white,
                      ))
                ],
              ),
              title: Text(
                'Notifications',
                style: GoogleFonts.poppins(
                    fontSize: 20, color: Colors.white),
              )),
          body: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: Column(
              children: List.generate(10, (i)=>ListTile(
                onTap: (){},
                leading: FaIcon(FontAwesomeIcons.bell, color: Constants.buttonColor,),
                title: Text('Notification $i'),
                subtitle: Text('This is the message you'),
              )),
            ),),
          ),
        ),
      );
  }
}
