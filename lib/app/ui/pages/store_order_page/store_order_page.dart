import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/store_order_controller.dart';

class StoreOrderPage extends GetView<StoreOrderController> {
      const StoreOrderPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
        child: Text('StoreOrder'),
      );
  }
}
