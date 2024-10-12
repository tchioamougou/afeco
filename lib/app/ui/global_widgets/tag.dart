import 'package:flutter/cupertino.dart';

class Tag extends StatelessWidget {
  const Tag(
      {super.key, required this.content,
      required this.color,
      required this.backgroundColor});
  final String content;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Text(
        content,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
