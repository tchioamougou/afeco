import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HowItWorks extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'question': 'question1', 'description': 'question1_description'},
    {'question': 'question2', 'description': 'question2_description'},
    {'question': 'question3', 'description': 'question3_description'},
    {'question': 'question4', 'description': 'question4_description'},
    {'question': 'question5', 'description': 'question5_description'},
    {'question': 'question6', 'description': 'question6_description'},
    {'question': 'question7', 'description': 'question7_description'},
    {'question': 'question8', 'description': 'question8_description'},
    {'question': 'question9', 'description': 'question9_description'},
    {'question': 'question10', 'description': 'question10_description'},
    {'question': 'question11', 'description': 'question11_description'},
    {'question': 'question12', 'description': 'question12_description'},
    {'question': 'question13', 'description': 'question13_description'},
    {'question': 'question14', 'description': 'question14_description'}
  ];

   HowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'howSaveFoodWorks'.tr,),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            dense: true,
            title: Text(item['question']!.tr),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
            Get.toNamed(AppRoutes.HOW_IT_WORKS_SHOW_SETTINGS,arguments: item);
            },
          );
        },
      ),
    );
  }
}