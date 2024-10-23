import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;
  final Function(bool isChecked) onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Expanded(
            child: Text(
          widget.label,
          style: TextStyle(fontSize: 16),
        )),
      ],
    );
  }
}
