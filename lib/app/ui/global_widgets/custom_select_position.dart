import 'package:afeco/app/data/models/place_model.dart';
import 'package:afeco/app/ui/global_widgets/custom_location_choose.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSelectPosition extends StatelessWidget {

  final ValueChanged<PlaceModel> onChanged;
   PlaceModel placeModel;
  final VoidCallback onClose;
   CustomSelectPosition({super.key,
    required this.onChanged,
    required this.onClose, required this.placeModel
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => CustomLocationChoose(onChange: (p) {
                  onChanged(p);
                  placeModel = p;
                }, onClose: onClose,
                  defaultValue: placeModel,
                ),
              );
          },
          child: Container(

            padding: EdgeInsets.all(15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${placeModel.name}".tr, style: GoogleFonts.poppins(color: Constants.defaultHeaderColor,fontWeight:  FontWeight.bold),)
                  ,Text('Within ${placeModel.distance} km',style: GoogleFonts.poppins(color: Constants.defaultHeaderColor))
                ],
              ),
                 const SizedBox(width: 5,),
                 FaIcon(FontAwesomeIcons.chevronDown, size: 15,color: Constants.buttonColor,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
