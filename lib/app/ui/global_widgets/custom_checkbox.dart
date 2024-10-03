import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;
  final Function(bool isChecked) onChanged;

  const CustomCheckbox({
    Key? key,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Constants.buttonColor,
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
            widget.onChanged(isChecked);
          },
        ),
        Text(widget.label),
      ],
    );
  }
}
