import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomLocationChoose extends StatelessWidget {
  const CustomLocationChoose({super.key});
  @override
  Widget build(BuildContext context) {
    Rx<RangeValues> rang = RangeValues(1, 20).obs;
    return MainLayout(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Expanded(
                child: Text('Choose a location to seat what\'s available'),
              ),
              titleTextStyle: TextStyle(fontSize: 15, color: Colors.black),
              centerTitle: true,
            ),
            backgroundColor: Constants.defaultBorderColor,
            body: Column(
              children: [],
            ),
          ),
          Obx(() => Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Label(title: 'Select a distance'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          child: RangeSlider(
                            values: rang.value,
                            divisions: 20,
                            onChanged: (va) {
                              rang.value = va;
                            },
                            min: 1,
                            max: 100,
                            activeColor: Constants.buttonColor,
                          ),
                        ),
                        Text('${rang.value.end.toInt()} Km'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SearchBar(
                      leading: FaIcon(FontAwesomeIcons.search),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'use my current location',
                          style: TextStyle(
                              color: Constants.defaultHeaderColor,
                              fontWeight: FontWeight.w900),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        onPressed: () {},
                        text: 'Apply',
                        backgroundColor: Constants.buttonColor)
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
