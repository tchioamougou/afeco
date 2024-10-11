import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/store_home_controller.dart';

class StoreHomePage extends GetView<StoreHomeController> {
      const StoreHomePage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
        child: Text('StoreHome'),
      );
  }
}
