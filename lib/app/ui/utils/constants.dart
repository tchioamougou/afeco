import 'dart:ui';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';


class Constants{
  static Color buttonColor =const Color.fromRGBO(17,77,77,1);
  static Color defaultHeaderColor =const Color.fromRGBO(17,77,77,1);
  static Color defaultBorderColor= const Color.fromRGBO(17,77,77,1);
  static  Color defaultBackGround = const Color.fromRGBO(243, 241, 226,1);
  static String? cinetApiKey = dotenv.env['CINET_API_KEY'];
  static String? cinetSiteId = dotenv.env['CINET_SITE_ID'];
  static String? cinetNotifyUrl = dotenv.env['CINET_NOTIFY_URL'];
  static String stripePublicKey = dotenv.env['STRIPE_PUBLIC_KEY']!;
  static String defaultImage ='assets/image/avatars/smile.png';
  static final oCameroon =  NumberFormat.currency(locale: 'en_CM',name: 'CFA');
}

class AppWriteCollection{
  static String userCollections ="670857ac0026263f44c0";
  static String givingPackagesCollections ="67087a8a00131eeb3a6c";
  static String storeCollections ="6708761c0014340524e3";
  static String bagsCollections ="6709428b003b85f5b749";
  static String bagOrderCollections ="670d8c120016e44c7ba4";
  static String foodInventories ="670daa4800315d542ca3";
  static String mealPlanCollection='670e07220006629e1425';
  static String foodBankCollection='67190fd200379c43e72f';
  static String donationCollection="671a18c50012d14dc8bd";
}


class AppWriteBucket{
  static String profileBucket ="670943f5001abc09a533";
  static String urlBucket='https://cloud.appwrite.io/v1/storage/buckets/670943f5001abc09a533/files/fileId/view?project=save-food&project=save-food&mode=admin';
}

enum OrderStatus { payed, closed, cancel }
enum GivingPackageStatus{
  open, reserved,closed,canceled
}
enum BagStatus{
  available, soldOut,canceled
}
enum SelectPaymentMethod{
  creditCard, mobile
}