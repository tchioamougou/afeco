
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  Label({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18,color: Constants.defaultBorderColor),
          ),
        ],
      ),
    );
  }
}