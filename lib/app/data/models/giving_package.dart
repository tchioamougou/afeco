import 'dart:convert';

import 'package:afeco/app/data/models/food_model.dart';

class GivingPackage {
  String users;
  String name;
  double lat;
  double long;
  String phone;
  String email;
  String address;
  String typeOfPackaging;
  String packagingCondition;
  String reasonForGiving;
  List<String> products;
  List<String> allergens;
  List<String> restrictions;
  String preferredRecoveryModes;
  DateTime availableDateStart;
  DateTime availableDateEnd;
  DateTime createdDate;
  String status;
  String reservedBy;
  String shareWith;
  String documentId;
  GivingPackage({
    required this.users,
    required this.name,
    required this.lat,
    required this.long,
    required this.phone,
    required this.email,
    required this.address,
    required this.typeOfPackaging,
    required this.packagingCondition,
    required this.reasonForGiving,
    required this.products,
    required this.allergens,
    required this.restrictions,
    required this.preferredRecoveryModes,
    required this.availableDateStart,
    required this.availableDateEnd,
    required this.createdDate,
    required this.status,
    required this.reservedBy,
    required this.shareWith,
    required this.documentId,
  });
  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'name': name,
      'lat': lat,
      'long': long,
      'phone': phone,
      'email': email,
      'address': address,
      'typeOfPackaging': typeOfPackaging,
      'packagingCondition': packagingCondition,
      'reasonForGiving': reasonForGiving,
      'products': products,
      'allergens': allergens,
      'restrictions': restrictions,
      'preferredRecoveryModes': preferredRecoveryModes,
      'availableDateStart': availableDateStart.toIso8601String(),
      'availableDateEnd': availableDateEnd.toIso8601String(),
      'createdDate': createdDate.toIso8601String(),
      'status': status,
      'reservedBy': reservedBy,
      'shareWith': shareWith,
      "documentId":documentId
    };
  }

  factory GivingPackage.fromJson(Map<String, dynamic> json) {
    return GivingPackage(
      users: json['users'].toString() ,
      name: json['name'],
      lat: json['lat'].toDouble(),
      long: json['long'].toDouble(),
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      typeOfPackaging: json['typeOfPackaging'],
      packagingCondition: json['packagingCondition'],
      reasonForGiving: json['reasonForGiving'],
      products: List<String>.from(json['products']),
      allergens: List<String>.from(json['allergens']),
      restrictions: List<String>.from(json['restrictions']),
      preferredRecoveryModes: json['preferredRecoveryModes'],
      availableDateStart: DateTime.parse(json['availableDateStart']),
      availableDateEnd: DateTime.parse(json['availableDateEnd']),
      createdDate: DateTime.parse(json['createdDate']),
      status: json['status'],
      reservedBy: json['reservedBy'],
      shareWith: json['shareWith'],
        documentId:json['documentId']
    );
  }
  List<FoodModel> getFoodModels(){
    return products.map((e)=>FoodModel.fromJson(json.decode(e) as Map<String,dynamic>)).toList();
  }
}
