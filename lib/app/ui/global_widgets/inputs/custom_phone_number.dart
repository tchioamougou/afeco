import 'package:afeco/app/ui/utils/constants.dart';
import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPhoneNumber extends StatelessWidget {
  final String label;
  final bool isRequired;
  final ValueChanged<String> onValueChanged;
  final ValueChanged<Country> onCountryChange;

  final TextEditingController controller;
  final String? hintText;
  final String? helper;

  const CustomPhoneNumber(
      {super.key,
      required this.label,
      required this.isRequired,
      required this.onValueChanged,
      required this.controller,
      required this.onCountryChange,
      this.hintText,
      this.helper});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: GoogleFonts.robotoSerif(color: Colors.black, fontSize: 15),
            children: [
              TextSpan(
                  text: (isRequired) ? '*' : '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.redAccent)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Form(
          autovalidateMode: AutovalidateMode.always,
          child: TextFormField(
              onChanged: (value) {
                onValueChanged(value);
              },
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Constants.defaultBorderColor),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  hintText: hintText ?? '(123) 456-7890',
                  helper: helper != null
                      ? Text(
                          helper!,
                          style: const TextStyle(color: Colors.grey),
                        )
                      : null,
                  prefixIcon: CountryCodePicker(
                    onInit: (Country? country) {},
                    onChanged: (Country? country) {
                      if(country!=null){
                        onCountryChange(country);
                      }
                    },
                    // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                    flagDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    initialSelection: 'CM',
                  )),
              style: Theme.of(context).textTheme.labelLarge,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PhoneNumberFormatter(),
              ],
              validator: (value) {
                if ((value == null || value.isEmpty) && isRequired) {
                  return 'Please enter some text';
                }

                return null;
              }),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
