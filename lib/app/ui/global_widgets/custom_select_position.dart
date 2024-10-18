import 'package:afeco/app/ui/global_widgets/custom_location_choose.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class CustomSelectPosition extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? withinValue;
  final String? positionValue;
  final ValueChanged<int> onWithinChanged;
  final ValueChanged<LatLng> onPositionChanged;
  final VoidCallback onClose;
  const CustomSelectPosition({
    super.key,
    required this.label,
    required this.options,
    this.positionValue,
    this.withinValue,
    required this.onPositionChanged,
    required this.onWithinChanged,
    required this.onClose
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (options.isNotEmpty) {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => CustomLocationChoose(onChange: onPositionChanged, onClose: onClose, onChangeRange: (int ) {
                  onWithinChanged(int);
                },),
              );
            }
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
                  Text("Your current position".tr, style: GoogleFonts.poppins(color: Constants.defaultHeaderColor,fontWeight:  FontWeight.bold),)
                  ,Text('Within $withinValue',style: GoogleFonts.poppins(color: Constants.defaultHeaderColor))
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
