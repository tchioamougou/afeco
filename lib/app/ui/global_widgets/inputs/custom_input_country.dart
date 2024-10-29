import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';

class CustomInputCountry extends StatelessWidget {
  const CustomInputCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: CountryCodePicker(
        mode: CountryCodePickerMode.bottomSheet,
        onChanged: (country) {

        },
        initialSelection: 'CM',
        showFlag: true,
        showDropDownButton: false,
        showCountryOnly: true,
        showOnlyCountryWhenClosed: true,

      ),
    );
  }
}
