
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  const Label({required this.title, this.color});
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18,color: color ?? Constants.defaultBorderColor ),
          ),
        ],
      ),
    );
  }
}