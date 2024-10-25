import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListStile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Widget? trailing;
  final Widget? subtitle;
  const CustomListStile({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.trailing,
    this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return     ListTile(
    dense: false,
    onTap: onPress,
    subtitle: subtitle,
    title: Text(title,style: TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.black87,
    fontSize: 20.sp),),
    leading: FaIcon(icon, color: Constants.defaultHeaderColor,size: 22,),
    trailing:trailing,
    )
    ;
  }
}
