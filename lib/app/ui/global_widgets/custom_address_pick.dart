import 'package:afeco/app/data/models/place_model.dart';
import 'package:afeco/app/ui/global_widgets/custom_address_map.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAddressPick extends StatelessWidget {
  final String label;
  final bool isRequired;
  final ValueChanged<PlaceModel> onValueChanged; // Use OnValueChanged type

  const CustomAddressPick({super.key,
    required this.label,
    required this.onValueChanged, // Use onValueChanged instead of controller
    this.isRequired = false,

  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text:
            label,
            style: GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
            children: [
              TextSpan(
                  text: (isRequired) ? '*' : '',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constants.defaultBorderColor),
                borderRadius: BorderRadius.circular(8)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          controller: controller,
          onTap: (){
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => CustomAddressMap(onClose: (){},onChange: (val){
                onValueChanged(val);
                controller.text = val.displayName!;
                Get.back();
              },),
            );
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}