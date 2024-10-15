
import 'package:afeco/app/data/models/store_model.dart';

class Bag {
  String name;
  double originalPrice;
  double price;
  int quantity;
  DateTime pickupDateStart;
  DateTime pickupDateEnd;
  int rest;
  DateTime createdDate;
  DateTime lastModifyDate;
  String stores;
  String documentId;
  Bag({
    required this.name,
    required this.originalPrice,
    required this.price,
    required this.quantity,
    required this.pickupDateStart,
    required this.pickupDateEnd,
    required this.rest,
    required this.createdDate,
    required this.lastModifyDate,
    required this.stores,
    required this.documentId
  });

  factory Bag.fromJson(Map<String, dynamic> json) {
    return Bag(
      name: json['name'],
      originalPrice: json['originalPrice'].toDouble(),
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      pickupDateStart: DateTime.parse(json['pickupDateStart']),
      pickupDateEnd: DateTime.parse(json['pickupDateEnd']),
      rest: json['rest'],
      createdDate: DateTime.parse(json['createdDate']),
      lastModifyDate: DateTime.parse(json['lastModifyDate']),
      stores: json['stores'],
        documentId:json['documentId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'originalPrice': originalPrice,
      'price': price,
      'quantity': quantity,
      'pickupDateStart': pickupDateStart.toIso8601String(),
      'pickupDateEnd': pickupDateEnd.toIso8601String(),
      'rest': rest,
      'createdDate': createdDate.toIso8601String(),
      'lastModifyDate': lastModifyDate.toIso8601String(),
      'stores': stores,
      'documentId':documentId
    };
  }
}



class BagRelation {
  String name;
  double originalPrice;
  double price;
  int quantity;
  DateTime pickupDateStart;
  DateTime pickupDateEnd;
  int rest;
  DateTime createdDate;
  DateTime lastModifyDate;
  StoreModel stores;
  String documentId;
  BagRelation({
    required this.name,
    required this.originalPrice,
    required this.price,
    required this.quantity,
    required this.pickupDateStart,
    required this.pickupDateEnd,
    required this.rest,
    required this.createdDate,
    required this.lastModifyDate,
    required this.stores,
    required this.documentId
  });

  factory BagRelation.fromJson(Map<String, dynamic> json) {
    return BagRelation(
      name: json['name'],
      originalPrice: json['originalPrice'].toDouble(),
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      pickupDateStart: DateTime.parse(json['pickupDateStart']),
      pickupDateEnd: DateTime.parse(json['pickupDateEnd']),
      rest: json['rest'],
      createdDate: DateTime.parse(json['createdDate']),
      lastModifyDate: DateTime.parse(json['lastModifyDate']),
      stores: StoreModel.fromJson(json['stores']),
        documentId:json['documentId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'originalPrice': originalPrice,
      'price': price,
      'quantity': quantity,
      'pickupDateStart': pickupDateStart.toIso8601String(),
      'pickupDateEnd': pickupDateEnd.toIso8601String(),
      'rest': rest,
      'createdDate': createdDate.toIso8601String(),
      'lastModifyDate': lastModifyDate.toIso8601String(),
      'stores': stores,
      'documentId':documentId
    };
  }
}