import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderCustom extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPress;
   HeaderCustom({super.key, required this.icon, required this.onPress});
  final List<String> profileIcons =['user',"heat",'face-smile',"solid-face-smile","sun","user-secret","nmug-saucer"];
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        InkWell(
          onTap: (){
            Get.dialog(
              barrierDismissible: false,
              AlertDialog(
                backgroundColor: Constants.buttonColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.close,color: Colors.white,))
                  ],
                ),
                content:Container(
                  width: double.maxFinite,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: profileIcons.length,
                    itemBuilder: (context, index) {
                      return IconButton(
                        onPressed: (){},
                        icon: Icon(FontAwesomeIcons.arrowPointer,color: Colors.white,),
                      );
                    },
                  ),
                ),
              )
              )
             ;
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                border: Border.all(color: Constants.defaultBorderColor,width: 1)
            ),
            child:ClipRRect(
              child: Image.asset(
                'assets/image/planet.png',
              ),
              borderRadius: BorderRadius.circular(300),
            ) ,
          ),
        )
        ,
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hi!,${UserService.instance.user!.name}'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins-light',
                        color: Constants.defaultHeaderColor),
                  ),
                ],
              ),
              Container(
                width: 200.w,
                child: Text(
                  'Let save food today',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Constants.defaultHeaderColor,
                      fontFamily: 'poppins-light'),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Stack(
                children: [
                  IconButton.outlined(
                    onPressed: onPress,
                    icon: icon,
                    style: ElevatedButton.styleFrom(
                        backgroundColor:Constants.defaultBorderColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 15)),
                  ),
                  Positioned(
                      top: 5,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300),
                          color: Colors.white,

                        ),
                        child: Text('20',style: GoogleFonts.poppins(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),),
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
