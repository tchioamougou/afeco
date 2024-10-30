import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomInput extends StatefulWidget {
  final String label;
  final bool isRequired;
  final ValueChanged<String> onValueChanged; // Use OnValueChanged type
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? helper;
  final int maxLines;
  final bool isEmail;
 final TextEditingController controller;
  const CustomInput({super.key,
    required this.label,
    required this.onValueChanged, // Use onValueChanged instead of controller
    required this.hintText,
    this.isRequired = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.helper,this.maxLines = 1,
    required this.controller,
    this.isEmail = false
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  String? _emailErrorText;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text:
            widget.label,
              style: GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
            children: [
              TextSpan(
                  text: (widget.isRequired) ? ' *' : '',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          onChanged: (value) => widget.onValueChanged(value),
          validator: (val){
            if(widget.isRequired && (val==null || val.isEmpty)){
              return 'This field is required';
            }else if(widget.isEmail&&!isEmailValid(val!)){
              return 'Enter a valid email address';
            }
            return null;
          },
          controller: widget.controller ,// Pass value to onValueChanged
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            helper:widget.helper!=null?Text(widget.helper!, style: const TextStyle(color: Colors.grey),):null,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constants.defaultBorderColor),
                borderRadius: BorderRadius.circular(8)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
            ),
            errorBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(8),
            ) ,
            focusedErrorBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  bool isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }
}