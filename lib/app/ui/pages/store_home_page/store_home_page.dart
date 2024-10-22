import 'package:afeco/app/controllers/store_home_controller.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_card_item.dart';
import 'package:afeco/app/ui/global_widgets/label.dart';
import 'package:afeco/app/ui/global_widgets/no_elements/custom_no_element.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
          appBar: AppBar(
            backgroundColor: Constants.defaultHeaderColor,
            title: Text(
              'Product in store'.tr,
              style: GoogleFonts.poppins(
                  fontSize: 20, color: Colors.white),
            )),
          body:Obx((){
            if(controller.bags.isNotEmpty){
              return Column(
                children: [
                  const SizedBox(height: 10,),
                  ...controller.bags.value.map ((index){
                    return Container(
                      child:CustomCardItem(
                        bg: index,
                        width: 0.95,
                      ),
                    );
                  }).toList()
                ],
              );
            }else {
              return CustomNoElement(image: 'assets/image/position.png', title: "You Have no surprise bags in the market ", description: "Description", actionLabel: "Start Saving Food", onPress: (){
                Get.toNamed(AppRoutes.SAVE);
              });

            }
          })
        ),
      );
  }
}
