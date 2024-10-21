import 'package:afeco/app/data/models/food_inventory_model.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FoodInventoryItem extends StatelessWidget {
  final VoidCallback onDelete;
  final String image;
  final FoodInventoryShow foodModel;

  const FoodInventoryItem({
    super.key,
    required this.onDelete,
    required this.foodModel,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final f =  DateFormat('dd-MM-yyyy');
    return InkWell(
      onTap: onDelete,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 80,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: Constants.defaultBorderColor.withOpacity(0.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  image,
                  height: 70,
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      foodModel.foodName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins( fontWeight: FontWeight.bold,),
                    ),
                    const SizedBox(height: 5,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${'categories'.tr}: ${foodModel.category}',),
                        const SizedBox(width: 5,),
                        Text('${'expiredAt'.tr}: ${f.format(foodModel.expirationDate)}'),
                      ],
                    )
                  ],
                ),
                const SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon:  FaIcon(FontAwesomeIcons.deleteLeft, color: Constants.buttonColor,))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
