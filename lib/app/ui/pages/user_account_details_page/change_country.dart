import 'package:afeco/app/controllers/user_account_details_controller.dart';
import 'package:afeco/app/data/models/global_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/global_widgets/custom_app_bar.dart';
import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/global_widgets/custom_input.dart';
import 'package:afeco/app/ui/global_widgets/inputs/custom_input_country.dart';
import 'package:afeco/app/ui/global_widgets/inputs/custom_phone_number.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

class ChangeCountryPage extends StatefulWidget {
  const ChangeCountryPage({super.key});

  @override
  State<ChangeCountryPage> createState() => _ChangeCountryPageState();
}

class _ChangeCountryPageState extends State<ChangeCountryPage> {
  String countryName ='';
  String countryCode ='';
  @override
  void initState() {
    // TODO: implement initState
    countryName = UserService.instance.user!.countryName;
    countryCode = UserService.instance.user!.countryCode;
    super.initState();
  }
  Future<void> updateCountry()async{
    if(countryName.isNotEmpty){
      EasyLoading.show();
      try{
        await GlobalService.updateUser({
         'countryName':countryName ,
          'countryCode':countryCode
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
          title: 'ChangeCountry'.tr,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               CustomInputCountry(isRequired: true,label: 'country'.tr,onValueChanged: (val){
                 setState(() {
                   countryName = val.name;
                   countryCode = val.code;
                 });
               },),
                CustomButton(onPressed: (){
                  updateCountry();
                }, text: 'save'.tr, backgroundColor: Constants.defaultHeaderColor, disable: UserService.instance.user!.countryCode==countryCode,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
