import 'package:afeco/app/ui/layouts/main/main_layout.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListStile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Widget? subtitle;
  final IconData? trailing;
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
    dense: true,
    onTap: onPress,
    subtitle: subtitle,
    title: Text(title,style: TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black87,
    fontSize: 18.sp),),
    leading: FaIcon(icon, color: Constants.defaultHeaderColor,size: 18,),
    trailing:trailing!=null?FaIcon(trailing, color: Colors.black,size: 18,):null,
    )
    ;
  }
}
