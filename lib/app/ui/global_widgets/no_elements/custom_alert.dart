import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String image;
  final String title;
  final String actionLabel;
  final VoidCallback onPress;
  final bool isAction;
  const CustomAlert(
      {super.key,
        required this.image,
        required this.title,
        required this.actionLabel,
        required this.onPress,
        this.isAction = true
      });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Image.asset(
                image,
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 19,
                    color: Constants.defaultBorderColor,
                  )),

              SizedBox(
                height: 20,
              ),
              if(isAction)
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
    );
  }
}
