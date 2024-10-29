import 'package:afeco/app/ui/utils/constants.dart';
import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPhoneNumber extends StatelessWidget{
  const CustomPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: TextFormField(
          onChanged: (value) {

          },
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,

          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constants.defaultBorderColor),
                  borderRadius: BorderRadius.circular(8)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)
              ),
              hintText: '(123) 456-7890',
              prefixIcon: CountryCodePicker(
                onInit: (Country? country) {
                },
                onChanged: (Country? country) {
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
            FilteringTextInputFormatter.singleLineFormatter,
            PhoneNumberFormatter(),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }


            return null;
          }),
    );
  }

}