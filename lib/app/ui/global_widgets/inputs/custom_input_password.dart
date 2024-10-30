import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputPassword extends StatefulWidget {
  final String label;
  final bool isRequired;
  final ValueChanged<String> onValueChanged; // Use OnValueChanged type
  final String hintText;
  final String? helper;
  final TextEditingController controller;
  const CustomInputPassword({
    super.key,
    required this.label,
    required this.onValueChanged, // Use onValueChanged instead of controller
    required this.hintText,
    this.isRequired = false,
    this.helper,
    required this.controller,
  });

  @override
  State<CustomInputPassword> createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.label,
            style: GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
            children: [
              TextSpan(
                  text: (widget.isRequired) ? '*' : '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.redAccent)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: !_showPassword,
          onChanged: (value) => widget.onValueChanged(value),
          controller: widget.controller, // Pass value to onValueChanged
          keyboardType: TextInputType.visiblePassword,
          validator: (val){
            if(widget.isRequired && (val==null || val.isEmpty)){
              return 'thisFieldRequired'.tr;
            }
            return null;
          },
          decoration: InputDecoration(
            helper: widget.helper != null
                ? Text(
                    widget.helper!,
                    style: const TextStyle(color: Colors.grey),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constants.defaultBorderColor),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
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
            prefixIcon: Icon(Icons.security),
            suffixIcon: IconButton(
              icon: Icon(
                _showPassword
                    ? FontAwesomeIcons.eyeSlash
                    : FontAwesomeIcons.eye,
                color:
                    _showPassword ? Constants.defaultHeaderColor : Colors.grey,
              ),
              onPressed: () {
                setState(() => _showPassword = !_showPassword);
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
