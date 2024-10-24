
class DonationModel {
  String documentId;
  String users;
  String foodBanks;
  String paymentMode;
  double amount;
  String paymentReference;
  DateTime dateDon;

  DonationModel({
    required this.documentId,
    required this.users,
    required this.foodBanks,
    required this.paymentMode,
    required this.amount,
    required this.paymentReference,
    required this.dateDon,
  });

  factory DonationModel.fromJson(Map<String, dynamic> json) {
    return DonationModel(
      documentId: json['documentId'] as String,
      users: json['users'] as String,
      foodBanks: json['foodBanks'] as String,
      paymentMode: json['paymentMode'] as String,
      amount: json['amount'] as double,
      paymentReference: json['paymentReference'] as String,
      dateDon: DateTime.parse(json['dateDon']), // Assuming dateDon is stored as a string in ISO 8601 format
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'users': users,
      'foodBanks': foodBanks,
      'paymentMode': paymentMode,
      'amount': amount,
      'paymentReference': paymentReference,
      'dateDon': dateDon.toIso8601String(), // Convert DateTime to ISO 8601 string for JSON
    };
  }
}