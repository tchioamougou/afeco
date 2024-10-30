import 'package:afeco/app/controllers/user_account_details_controller.dart';
import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/inputs/custom_phone_number.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class ChangePhonePage extends StatefulWidget {
  const ChangePhonePage({super.key});

  @override
  State<ChangePhonePage> createState() => _ChangePhonePageState();
}

class _ChangePhonePageState extends State<ChangePhonePage> {
  TextEditingController phoneController = TextEditingController();
  String countryCode ='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<void> updatePhone()async{
    if(phoneController.text.isNotEmpty){
      EasyLoading.show();
      try{
        await GlobalService.updateUser({
          'phoneNumber':'${countryCode} ${phoneController.text}' ,
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
          title: 'changePhone'.tr,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPhoneNumber(label: 'phoneNumber'.tr, isRequired: false, onValueChanged: (val){
                    setState(() {

                    });
                }, controller: phoneController, onCountryChange: (val){
                  countryCode = val.dialCode;
                },),
                CustomButton(onPressed: (){
                  updatePhone();
                }, text: 'save'.tr, backgroundColor: Constants.defaultHeaderColor, disable: UserService.instance.user!.phoneNumber==phoneController.text,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
