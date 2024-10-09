import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTime extends StatelessWidget {
  final String label;
  final bool isRequired;
  final ValueChanged<String> onValueChanged;
  final String hintText;

  const CustomTime({
    super.key,
    required this.label,
    required this.onValueChanged,
    required this.hintText,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    Rx<TextEditingController> controller =  TextEditingController().obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style:  GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
            children:  <TextSpan>[
              TextSpan(text: (isRequired)?'*':'', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Obx(()=>Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: TextField(
            readOnly: true,
            onTap: () async {
              TimeOfDay? pickedDate = await showTimePicker(
                context: context, initialTime: TimeOfDay.now(),

              );
              if (pickedDate != null)
              {
                controller.value.text = pickedDate.format(context);
                onValueChanged(controller.value.text);
              }
            },
            controller: controller.value,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              filled: true,
              fillColor: Colors.white54,
            ),
          ),
        )),
        const SizedBox(height: 15),
      ],
    );
  }
}
