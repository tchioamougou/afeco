import 'package:afeco/app/controllers/delete_account_controller.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class DeleteAccountPage extends GetView<DeleteAccountController> {
  const DeleteAccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Stack(
        children: [
          Scaffold(
            appBar: CustomAppBar(
              title: 'deleteAccount'.tr,
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/image/gifs/angry.gif',
                            height: 100,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text('byeTitle'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 19,
                                color: Constants.defaultBorderColor,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text('by1'.tr,
                              style: const TextStyle(),textAlign: TextAlign.center,),
                          SizedBox(
                            height: 10,
                          ),
                          Text('by2'.tr,
                              style: const TextStyle(),textAlign: TextAlign.center,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(

              bottom: 10,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                child:  Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: CustomButton(
                              onPressed: () {
                                //TODO DELETE USER ACCOUNT
                              },
                              text: 'deleteAccount'.tr,
                              backgroundColor: Colors.red.shade900),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,

                          child: TextButton(

                            child: Text('cancel'.tr),onPressed: (){
                              Get.back();
                          },))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
