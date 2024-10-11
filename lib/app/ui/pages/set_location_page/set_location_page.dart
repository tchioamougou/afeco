import 'package:afeco/app/routes/app_routes.dart';
import 'package:afeco/app/ui/global_widgets/custom_location_choose.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/set_location_controller.dart';

class SetLocationPage extends GetView<SetLocationController> {
      const SetLocationPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomLocationChoose(onClose: (){
        Get.offAllNamed(AppRoutes.INIT_PAGE);
      }, onChange: (val){
        Get.offAllNamed(AppRoutes.INIT_PAGE);
      }, onChangeRange: (int ) {  },),
    );
  }
}
