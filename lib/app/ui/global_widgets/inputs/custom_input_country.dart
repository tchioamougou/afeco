import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputCountry extends StatelessWidget {
  final String label;
  final bool isRequired;
  final ValueChanged<Country> onValueChanged;
  final String? initValue;
  const CustomInputCountry({super.key, required this.label, required this.isRequired, required this.onValueChanged, this.initValue});

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
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.1),
          ),
          child: CountryCodePicker(
            mode: CountryCodePickerMode.bottomSheet,
            onChanged: (country) {
              onValueChanged(country);
            },
            initialSelection: initValue,
            showFlag: true,
            showDropDownButton: false,
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,

          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
