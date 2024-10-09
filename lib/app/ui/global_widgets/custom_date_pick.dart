import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDatePick extends StatefulWidget {
  final String label;
  final bool isRequired;
  final ValueChanged<String> onValueChanged; // Use OnValueChanged type
  final String hintText;

  const CustomDatePick({
    super.key,
    required this.label,
    required this.onValueChanged,
    required this.hintText,
    this.isRequired = false,
  });

  @override
  State<CustomDatePick> createState() => _CustomDatePickState();
}

class _CustomDatePickState extends State<CustomDatePick> {
  @override
  Widget build(BuildContext context) {
    Rx<TextEditingController> controller =  TextEditingController().obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style:  GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
            children:  <TextSpan>[
              TextSpan(text: (widget.isRequired)?'*':'', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Obx(()=>Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: TextField(
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null)
              {
                final f =  DateFormat('dd-MM-yyyy');
                 controller.value.text = f.format(pickedDate);
                widget.onValueChanged(controller.value.text);
              }
            },
            controller: controller.value,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )),
        const SizedBox(height: 15),
      ],
    );
  }
}
