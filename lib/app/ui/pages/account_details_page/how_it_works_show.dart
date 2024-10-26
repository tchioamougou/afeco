import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HowItWorksShow extends StatefulWidget {
  @override
  State<HowItWorksShow> createState() => _HowItWorksShowState();
}

class _HowItWorksShowState extends State<HowItWorksShow> {
  Map<String,String> item ={};
@override
  void initState() {
  item = Get.arguments as Map<String, String>;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'howSaveFoodWorks'.tr,),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10 ),child: Column(
        children: [
          Card(
            elevation: 10,
            color: Colors.white,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item['question']}'.tr, style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("${item['description']}".tr),
                ],
              ),
            )
          ),
          SizedBox(height: 20,),
          Text('needAnyFurthersHelp'.tr),
          TextButton(onPressed: (){}, child: Text('contactUs'.tr, style: TextStyle(color: Constants.buttonColor),),)

        ],
      ),),
    );
  }
}