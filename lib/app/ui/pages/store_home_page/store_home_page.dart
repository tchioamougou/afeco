import 'package:afeco/app/controllers/store_home_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class StoreHomePage extends StatefulWidget {
      const StoreHomePage ({Key? key}) : super(key: key);

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {

  StoreHomeController controller = Get.find();
  @override
  void initState() {
  // TODO: implement initState
  controller.getBags();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
        child: Scaffold(
          body:Obx(()=>Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: Label(title: 'Product in store'),
              ),
              const SizedBox(height: 10,),
              Expanded(child: GridView.count(
                crossAxisCount: 2 ,
                childAspectRatio: 1.1,
                children: controller.bags.value.map ((index){
                  return Container(
                    child:CustomCardItem(
                      bg: index,
                    ),
                  );
                }).toList(),
              ))
            ],
          ))
        ),
      );
  }
}
