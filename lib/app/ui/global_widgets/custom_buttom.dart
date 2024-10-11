import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final Color backgroundColor;
  final bool disable;
  const CustomButton({super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    required this.backgroundColor,
    this.disable = false
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:!disable? onPressed :(){},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(color: Colors.grey,width: 0.001),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        backgroundColor: !disable? backgroundColor : Constants.buttonColor.withOpacity(0.1), // Adjust background color as needed
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
               fontSize: 16,
               color: Colors.white),
          ),
        ],
      ),
    );
  }
}
