import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Constants.defaultBorderColor),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: FaIcon(FontAwesomeIcons.arrowLeft),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                padding: EdgeInsets.zero),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: TextField(
                              decoration: InputDecoration(border: InputBorder.none,hintText: "search here"),
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.search,
                            color: Constants.buttonColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                       Container(
                         width: 150,
                           child:  Row(
                             children: [
                               FaIcon(FontAwesomeIcons.house),
                               SizedBox(width: 15,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('Home'),
                                   Text('Marche Accacias',overflow: TextOverflow.ellipsis,)
                                 ],
                               )
                             ],
                           ),
                       ),
                        Container(
                          width: 150,
                          child:  Row(
                            children: [
                              FaIcon(FontAwesomeIcons.house),
                              SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Home'),
                                  Text('Marche Accacias',overflow: TextOverflow.ellipsis,)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
