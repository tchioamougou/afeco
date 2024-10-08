import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class CustomBottomAction extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final Color backgroundColor;

  const CustomBottomAction({Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width:MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(vertical:7, horizontal: 5),
          decoration: BoxDecoration(
            border: Border.symmetric(vertical: BorderSide.none,horizontal: BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)) ),
            color: Colors.white,
          ),
          child: CustomButton(onPressed: onPressed, text: text, backgroundColor: backgroundColor),
        )
      ],
    );
  }
}
