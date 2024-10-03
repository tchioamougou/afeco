import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final Color backgroundColor;

  const CustomButton({Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(color: Colors.grey,width: 0.001),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        backgroundColor: backgroundColor, // Adjust background color as needed
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
               fontSize: 16,
               color: Colors.white),
          ),
        ],
      ),
    );
  }
}
