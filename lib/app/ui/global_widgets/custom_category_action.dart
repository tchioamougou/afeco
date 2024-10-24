import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomCategoryAction extends StatelessWidget {
  final VoidCallback onPress;
  final String image;
  final String title;


  const CustomCategoryAction({super.key,
    required this.onPress,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            width: 70,
            height: 70,
            decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(200)),
                color: Constants.defaultBorderColor.withOpacity(0.2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(image, height: 70,width: 50,fit: BoxFit.cover,),
            ),
          ),
          Center(
            child: SizedBox(
              width: 100,
              child: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center, style: GoogleFonts.poppins(), ),
            ),
          ),
        ],
      ),
    );
  }
}