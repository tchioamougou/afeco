import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodPlanningItem extends StatelessWidget {
  final VoidCallback onPress;
  final String image;
  final String title;
  final String cal;
  final String time;

  const FoodPlanningItem({
    super.key,
    required this.onPress,
    required this.title,
    required this.image, required this.cal, required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 80,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: Constants.defaultBorderColor.withOpacity(0.2)),
            child: Row(
              children: [
                Image.asset(
                  image,
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins( fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.telegram, size: 15, color: Constants.buttonColor,),
                        const SizedBox(width: 5,),
                        Text('$cal Calories',),
                        const SizedBox(width: 10,),
                        FaIcon(FontAwesomeIcons.clock, size: 15, color: Constants.buttonColor,),
                        const SizedBox(width: 5,),
                        Text('$time Min'),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
