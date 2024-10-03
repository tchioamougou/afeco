import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/header_custom.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20,30,20,0),
                child:HeaderCustom(),
              ),
              SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,0),
            child: Label(title: 'Food in your neighborhood'),
          ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                Row(
                  children: List.generate(10, (i)=>Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.sizeOf(context).width*0.8,
                    child: CustomCardItem(
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
                    ),
                  )),
                ),),
              Padding(
                padding: EdgeInsets.fromLTRB(20,0,20,0),
                child: Label(title: 'Recommend for you'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                Row(
                  children: List.generate(10, (i)=>Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.sizeOf(context).width*0.8,
                    child: CustomCardItem(
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
                    ),
                  )),
                ),),
              Padding(
                padding: EdgeInsets.fromLTRB(20,0,20,0),
                child: Label(title: 'Collect Now'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                Row(
                  children: List.generate(10, (i)=>Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.sizeOf(context).width*0.8,
                    child: CustomCardItem(
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
                    ),
                  )),
                ),),
            ],
          )
        ),
      ),
    );
  }
}
