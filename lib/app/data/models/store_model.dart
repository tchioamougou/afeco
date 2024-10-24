import 'dart:convert';

class StoreModel {
  String businessName;
  String typeBusiness;
  String streetNameNumber;
  String postalCode;
  String city;
  String country;
  String phoneNumber;
  String email;
  bool allow;
  DateTime createdDate;
  String userId;
  double lat;
  double long;
  String documentId;
  String profileCoverId;
  String profileLogoId;
  int totalLikes;
  int totalReviews;
  double rating;
  List<String> raisonOfJoining;
  StoreModel({
    required this.businessName,
    required this.typeBusiness,
    required this.streetNameNumber,
    required this.postalCode,
    required this.city,
    required this.country,
    required this.phoneNumber,
    required this.email,
    required this.allow,
    required this.createdDate,
    required this.userId,
    required this.lat,
    required this.long,
    required this.documentId,
    required this.profileCoverId,
    required this.profileLogoId,
    required this.raisonOfJoining,
    required this.totalLikes,
    required this.totalReviews,
    required this.rating,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      businessName: json['businessName'],
      typeBusiness: json['typeBusiness'],
      streetNameNumber: json['streetNameNumber'],
      postalCode: json['postalCode'],
      city: json['city'],
      country: json['country'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      allow: json['allow'],
      createdDate: DateTime.parse(json['createdDate']),
      userId: json['userId'],
      lat: json['lat'],
      long: json['long'],
      totalLikes: json['totalLikes']??0,
      totalReviews: json['totalReviews']??0,
      rating: json['rating']??0.0,
      documentId: json['documentId'] ?? "",
      profileCoverId: json['profileCoverId'] ?? "",
      profileLogoId: json['profileLogoId'] ?? "",
      raisonOfJoining: List<String>.from(json['raisonOfJoining']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'typeBusiness': typeBusiness,
      'streetNameNumber': streetNameNumber,
      'postalCode': postalCode,
      'city': city,
      'country': country,
      'phoneNumber': phoneNumber,
      'email': email,
      'allow': allow,
      'createdDate': createdDate.toIso8601String(),
      'userId': userId,
      'lat': lat,
      'long': long,
      "documentId": documentId,
      "profileCoverId": profileCoverId,
      "profileLogoId": profileLogoId,
      "raisonOfJoining": raisonOfJoining,
      "totalLikes": totalLikes,
      "totalReviews": totalReviews,
      "rating": rating,
    };
  }

  @override
  String toString() {
    return 'StoreModel{businessName: $businessName, typeBusiness: $typeBusiness, streetNameNumber: $streetNameNumber, postalCode: $postalCode, city: $city, country: $country, phoneNumber: $phoneNumber, email: $email, allow: $allow, createdDate: $createdDate, userId: $userId, lat: $lat, long: $long}';
  }
}
