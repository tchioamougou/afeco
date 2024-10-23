
class FoodBankModel {
  String name;
  String documentId;
  String description;
  String profileId;

  FoodBankModel({
    required this.name,
    required this.documentId,
    required this.description,
    required this.profileId,
  });

  factory FoodBankModel.fromJson(Map<String, dynamic> json) {
    return FoodBankModel(
      name: json['name'] as String,
      documentId: json['documentId'] as String,
      description: json['description'] as String,
      profileId: json['profileId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'documentId': documentId,
      'description': description,
      'profileId': profileId,
    };
  }
}