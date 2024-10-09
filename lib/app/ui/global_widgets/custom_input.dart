import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomInput extends StatelessWidget {
  final String label;
  final bool isRequired;
  final ValueChanged<String> onValueChanged; // Use OnValueChanged type
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? helper;
  final int maxLines;

  const CustomInput({Key? key,
    required this.label,
    required this.onValueChanged, // Use onValueChanged instead of controller
    required this.hintText,
    this.isRequired = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.helper,this.maxLines = 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onChanged: (value) => onValueChanged(value), // Pass value to onValueChanged
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          decoration: InputDecoration(
            helper:helper!=null?Text(helper!, style: const TextStyle(color: Colors.grey),):null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.defaultBorderColor),
              borderRadius: BorderRadius.circular(8)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
            ),
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}