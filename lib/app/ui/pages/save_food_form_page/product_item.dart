
import 'package:afeco/app/data/models/food_model.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

 class ProductItem extends StatelessWidget{
  final FoodModel foodModel;
  const ProductItem({super.key, required this.foodModel,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width*0.8,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width*0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${"name".tr}:${foodModel.name}"),
                Text("${"quantity".tr}:${foodModel.quantity}"),
                Text('${"expirationDate".tr}: ${foodModel.expirationDate}')
              ],
            ),
          ),

          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.deleteLeft,color: Constants.buttonColor,))
        ],
      ),
    );
  }

}