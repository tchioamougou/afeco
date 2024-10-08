import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSelectPosition extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? withinValue;
  final String? positionValue;
  final ValueChanged<String> onWithinChanged;
  final ValueChanged<String> onPositionChanged;
  const CustomSelectPosition({
    super.key,
    required this.label,
    required this.options,
    this.positionValue,
    this.withinValue,
    required this.onPositionChanged,
    required this.onWithinChanged
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
                context: context,
                builder: (context) => Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                                width: 70,
                                child: Divider(
                                  height: 20,
                                  thickness: 5,
                                  color: Constants.defaultHeaderColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      CustomInput(label: 'From', onValueChanged: onPositionChanged, hintText: 'Enter Place'),
                      const Text('Within'),
                      Column(
                        children: options.map((el) {
                          return ListTile(
                            title: Text(el,style:(withinValue != null && withinValue == el)?TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Constants.defaultHeaderColor):null ,), // Assuming options have a String representation
                            trailing:
                            (withinValue != null && withinValue == el)
                                ? Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Constants.buttonColor,
                            )
                                : null,
                            onTap: () {
                              onWithinChanged(el);
                              Navigator.pop(context);
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
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
