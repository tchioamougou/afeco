import 'package:afeco/app/routes/app_routes.dart';
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
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
              child: HeaderCustom(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.1, color: Constants.defaultBorderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(30))),
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
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "search here",
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Label(title: 'Category'),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.quickActions.map((e)=>CustomCategoryAction(onPress: (){
                        print('click here');
                        if(e['title']=='Planning'){
                          Get.toNamed(AppRoutes.FOOD_PLANNING);
                        }
                      }, title: e['title']!,image: e['image']!,)).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
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
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: Label(title: 'Recommend for you'),
                  ),
                  const SizedBox(height: 10,),
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
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: Label(title: 'Collect Now'),
                  ),
                  const SizedBox(height: 10,),
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
