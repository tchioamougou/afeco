class FoodModel {
  String name;
  String quantity;
  DateTime expirationDate;
  String category;

  FoodModel({
    required this.name,
    required this.quantity,
    required this.expirationDate,
    required this.category,
  });
  // Converts the FoodModel object to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'expirationDate': expirationDate.toIso8601String(),
      'category': category,
    };
  }

  // Creates a FoodModel object from a JSON Map
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'],
      quantity: json['quantity'],
      expirationDate: DateTime.parse(json['expirationDate']),
      category: json['category'],
    );
  }
}