import 'package:afeco/app/controllers/user_account_details_controller.dart';
import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class ChangeNamePage extends StatefulWidget {
  const ChangeNamePage({super.key});

  @override
  State<ChangeNamePage> createState() => _ChangeNamePageState();
}

class _ChangeNamePageState extends State<ChangeNamePage> {
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    nameController.text = UserService.instance.user!.name;
    super.initState();
  }
  Future<void> updateName()async{
    if(nameController.text.isNotEmpty){
      EasyLoading.show();
      try{
        await GlobalService.updateUser({
          'name':nameController.text,
        });
        Get.back();
      }catch(e){
        EasyLoading.showError('errorOccur'.tr);
      }finally{
        EasyLoading.dismiss();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'changeName'.tr,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                    label: 'name'.tr,
                    onValueChanged: (val) {
                      setState(() {});
                    },
                    hintText: 'name'.tr,
                    controller: nameController),
                CustomButton(
                  onPressed: () {
                    updateName();
                  },
                  text: 'save'.tr,
                  backgroundColor: Constants.defaultHeaderColor,
                  disable:
                      UserService.instance.user!.name == nameController.text,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    super.dispose();
  }
}
