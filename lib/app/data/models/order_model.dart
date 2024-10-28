import 'package:afeco/app/data/models/bag_model.dart';
import 'package:afeco/app/data/models/user_model.dart';

class OrderModel {
  String users;
  String bags;
  String documentId;
  String status;
  double price;
  int quantity;
  double unitePrice;
  String store;


  OrderModel({
    required this.users,
    required this.bags,
    required this.documentId,
    required this.status,
    required this.price,
    required this.quantity,
    required this.unitePrice,
    required this.store,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      users: json['users'],
      bags: json['bags'],
      documentId: json['documentId'],
      status: json['status'],
      price: json['price'].toDouble(),
      quantity: json['quantity'].toInt(),
      unitePrice: json['unitePrice'].toDouble(),
        store:json['store'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'bags': bags,
      'documentId': documentId,
      'status': status,
      'price': price,
      'quantity': quantity,
      'unitePrice': unitePrice,
      "store":store
    };
  }
}
class OrderShowModel {
  UserModel users;
  BagRelation bags;
  String documentId;
  String status;
  double price;
  int quantity;
  double unitePrice;

  OrderShowModel({
    required this.users,
    required this.bags,
    required this.documentId,
    required this.status,
    required this.price,
    required this.quantity,
    required this.unitePrice,
  });

  factory OrderShowModel.fromJson(Map<String, dynamic> json) {
    return OrderShowModel(
      users: UserModel.fromJson(json['users']),
      bags: BagRelation.fromJson(json['bags']),
      documentId: json['documentId'],
      status: json['status'],
      price: json['price'].toDouble(),
      quantity: json['quantity'].toInt(),
      unitePrice: json['unitePrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'bags': bags,
      'documentId': documentId,
      'status': status,
      'price': price,
      'quantity': quantity,
      'unitePrice': unitePrice,
    };
  }
}