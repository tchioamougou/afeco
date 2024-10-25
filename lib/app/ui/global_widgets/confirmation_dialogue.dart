import 'package:afeco/app/ui/global_widgets/custom_buttom.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationDialog extends StatelessWidget {
  final
  String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;


  const ConfirmationDialog({
  super.key,
  required this.title,
  required this.message,

  required this.onConfirm,
  required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
  return AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         TextButton(
           onPressed: onCancel,
           child:  Text('cancel'.tr),
         ),
         CustomButton(
           backgroundColor: Colors.red,
           onPressed: onConfirm,
           text: 'ok'.tr,
         ),
       ],
     )
    ],
  );
  }
}