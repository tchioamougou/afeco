import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          title,
          style: GoogleFonts.poppins(
              fontSize: 20, color: Colors.white),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}