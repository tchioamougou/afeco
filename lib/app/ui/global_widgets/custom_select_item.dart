import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSelectItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selectedValue;
  final String? hintText;
  final String? help;
  final ValueChanged<String> onChanged;
  const CustomSelectItem({
    super.key,
    required this.label,
    required this.options,
    this.selectedValue,
    this.hintText,
    this.help,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
        ),
        SizedBox(
          height: 8.h,
        ),
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
                      Label(
                        title: label,
                      ),
                      Column(
                        children: options.map((el) {
                          return ListTile(
                            title: Text(
                              el,
                              style:
                                  (selectedValue != null && selectedValue == el)
                                      ? TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          color: Constants.defaultHeaderColor)
                                      : null,
                            ), // Assuming options have a String representation
                            trailing:
                                (selectedValue != null && selectedValue == el)
                                    ? Icon(
                                        Icons.check_circle,
                                        size: 30,
                                        color: Constants.buttonColor,
                                      )
                                    : null,
                            onTap: () {
                              onChanged(el);
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
              color: Colors.grey.withOpacity(0.01),
            ),
            padding: EdgeInsets.all(15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (selectedValue != null)
                  Text(
                    selectedValue!,
                    style: TextStyle(fontSize: 17),
                  )
                else
                  Text(
                    hintText ?? '',
                    style: TextStyle(fontSize: 17),
                  ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ),
        if (help != null && help!.isNotEmpty) Text(help!,style: const TextStyle(color: Colors.grey),),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
