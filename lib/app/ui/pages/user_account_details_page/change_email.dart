import 'package:afeco/app/controllers/user_account_details_controller.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController oldEmailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'ChangeEmail'.tr,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(label: 'Old Email', onValueChanged: (val){
                  setState(() {

                  });
                }, hintText: 'Email', controller: oldEmailController),
                CustomInput(label: 'Email', onValueChanged: (val){
                  setState(() {

                  });
                }, hintText: 'Email', controller: emailController),
                CustomButton(onPressed: (){}, text: 'save'.tr, backgroundColor: Constants.defaultHeaderColor, disable: UserService.instance.user!.email==emailController.text,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    oldEmailController.dispose();
    super.dispose();
  }
}
