import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/custom_category_action.dart';
import 'package:afeco/app/ui/global_widgets/custom_save_food_neighbourdhood_item.dart';
import 'package:afeco/app/ui/global_widgets/header_custom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
              child: HeaderCustom(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 1, 10, 0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.1, color: Constants.defaultBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.search,
                          color: Constants.buttonColor,
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            padding: EdgeInsets.zero),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "search here",
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Label(title: 'Category'),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.quickActions.map((e)=>CustomCategoryAction(onPress: (){}, title: e['title']!,image: e['image']!,)).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: Label(title: 'Food for you'),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          10,
                              (i) => CustomSaveFoodNeighbourdhoodItem(
                                title: 'Penelope\'s',
                                description: 'Baked goods',
                                time: '17:40 - 18:00',
                                price: '£12.00',
                                imageUrl:
                                'https://noahhelps.org/wp-content/uploads/2021/03/March_Meal-Prep-1030x515.jpeg',
                                isFavorite: true,
                                onFavoritePressed: () {
                                  // Handle favorite toggle logic here
                                },
                              )),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: Label(title: 'Recommend for you'),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          10,
                              (i) =>CustomCardItem(
                                title: 'Penelope\'s',
                                description: 'Baked goods',
                                time: '17:40 - 18:00',
                                price: '£12.00',
                                imageUrl:
                                'https://www.rockmatsu.org/wp-content/uploads/2022/03/The-boy-who.png',
                                isFavorite: true,
                                onFavoritePressed: () {
                                  // Handle favorite toggle logic here
                                },
                              )),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: Label(title: 'Collect Now'),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          10,
                              (i) => CustomCardItem(
                                title: 'Penelope\'s',
                                description: 'Baked goods',
                                time: '17:40 - 18:00',
                                price: '£12.00',
                                imageUrl:'https://dovv-distribution.com/wp-content/uploads/2023/09/Djino-1-768x768.jpg',
                                isFavorite: true,
                                onFavoritePressed: () {
                                  // Handle favorite toggle logic here
                                },
                              )),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
