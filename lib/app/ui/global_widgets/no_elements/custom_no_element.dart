import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomNoElement extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String actionLabel;
  final VoidCallback onPress;
  const CustomNoElement(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.actionLabel,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  image,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Constants.defaultBorderColor,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(description, style: TextStyle()),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: CustomButton(
                      onPressed: onPress,
                      text: actionLabel,
                      backgroundColor: Constants.buttonColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
