import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/tag.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:afeco/app/ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class DonateWidget extends StatelessWidget {
  const DonateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:  BorderRadius.circular(13.0),
                  child: Image.asset(
                    'assets/image/donate.jpeg',
                    width: MediaQuery.sizeOf(context).width,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: ElevatedButton(
                      onPressed: (){
                        Get.toNamed(AppRoutes.DONATION);
                      },

                      child: Text('Donate', style: TextStyle(color: Constants.defaultHeaderColor),),

                    )
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:  BorderRadius.circular(100.0),
                          child: Image.asset(
                            'assets/image/img.png',
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        )
,
                        Text('Support a local charity', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18 )
                        )
                      ],
                    )
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
