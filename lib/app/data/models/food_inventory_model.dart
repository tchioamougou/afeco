import 'package:afeco/app/data/models/user_model.dart';

class FoodInventoryModel {
  String users;
  String documentId;
  String foodName;
  String quantity;
  String category;
  DateTime expirationDate;

  FoodInventoryModel({
    required this.users,
    required this.documentId,
    required this.foodName,
    required this.quantity,
    required this.category,
    required this.expirationDate,
  });

  factory FoodInventoryModel.fromJson(Map<String, dynamic> json) {
    return FoodInventoryModel(
      users: json['users'],
      documentId: json['documentId'],
      foodName: json['foodName'],
      quantity: json['quantity'],
      category: json['category'],
      expirationDate: DateTime.parse(json['expirationDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'documentId': documentId,
      'foodName': foodName,
      'quantity': quantity,
      'category': category,
      'expirationDate': expirationDate.toIso8601String(),
    };
  }
}


class FoodInventoryShow {
  UserModel users;
  String documentId;
  String foodName;
  String quantity;
  String category;
  DateTime expirationDate;

  FoodInventoryShow({
    required this.users,
    required this.documentId,
    required this.foodName,
    required this.quantity,
    required this.category,
    required this.expirationDate,
  });

  factory FoodInventoryShow.fromJson(Map<String, dynamic> json) {
    return FoodInventoryShow(
      users: UserModel.fromJson(json['users']),
      documentId: json['documentId'],
      foodName: json['foodName'],
      quantity: json['quantity'],
      category: json['category'],
      expirationDate: DateTime.parse(json['expirationDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users.toJson(),
      'documentId': documentId,
      'foodName': foodName,
      'quantity': quantity,
      'category': category,
      'expirationDate': expirationDate.toIso8601String(),
    };
  }
}