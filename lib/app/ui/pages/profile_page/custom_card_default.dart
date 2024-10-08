import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardDefault extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const CustomCardDefault({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.91,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Constants.buttonColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset('assets/image/save_food.png', height: 120,width: 120,),
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 18.sp),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        Center(
                          child: Text(
                            description,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: 50.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
