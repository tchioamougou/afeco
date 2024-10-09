import 'package:afeco/app/controllers/save_food_detail_controller.dart';
import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_bottom_action.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../layouts/main/main_layout.dart';

class SaveFoodDetailPage extends GetView<SaveFoodDetailController> {
  const SaveFoodDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Constants.defaultBorderColor,
            body: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton.outlined(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 15)),
                      ),
                      IconButton.outlined(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.heart),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 15)),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                ),
                const SizedBox(
                  height: 120,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Text('Fast food', style: GoogleFonts.timmana(fontWeight: FontWeight.w900, fontSize: 35,color: Constants.defaultHeaderColor),),
                      const SizedBox(height: 5,),
                      Text(
                        'Collect today: 20/10 - 12h-16h',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Address to Package: Yaounde - immeuble mercedes',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Divider(
                        height: 10,
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Thank Saving Food',style: GoogleFonts.sassyFrass(
                              fontSize: 40,
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.w900),),
                          ElevatedButton(onPressed: (){}, style:ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange) , child: Text('View Direction',style: GoogleFonts.poppins( fontSize: 15,color: Colors.white)))
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('About Content',textAlign: TextAlign.left,style: GoogleFonts.timmana( fontSize: 20,color: Constants.defaultHeaderColor,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(style: GoogleFonts.poppins( fontSize: 15,color: Colors.grey),'Papier de livraison Fast Food to Go biodégradable et écologique personnalisé Sac Restaurant Takeout emballage Take Away Kraft Paper Bag'),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 55,
            left: 70,
            child: Container(
              height: 250,
              width: 250,
              child: ClipRRect(
                child: Image.network(
                    'https://image.made-in-china.com/202f0j00mkHVMhqWZvYE/Custom-Eco-Friendly-Biodegradable-Brown-Fast-Food-to-Go-Delivery-Paper-Bag-Restaurant-Takeout-Packaging-Take-Away-Kraft-Paper-Bag.webp'),
                borderRadius: const BorderRadius.all(Radius.circular(300)),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  color: Colors.grey.shade100,
                  border: Border.all(
                      width: 4, color: Constants.defaultBorderColor)),
            ),
          ),
          Positioned(
              bottom: 0,
              child: CustomBottomAction(onPressed: (){
                Get.toNamed(AppRoutes.TANKING);
              }, text: 'Reserve', backgroundColor:  Constants.buttonColor))
        ],
      ),
    );
  }
}
