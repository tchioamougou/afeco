import 'dart:convert';

class FoodModel {
  String name;
  String quantity;
  DateTime? expirationDate;
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
      'expirationDate': expirationDate?.toIso8601String(),
      'category': category,
    };
  }

  // Creates a FoodModel object from a JSON Map
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'],
      quantity: json['quantity'],
      expirationDate:json['expirationDate']!=null? DateTime.parse(json['expirationDate']):null,
      category: json['category'],
    );
  }
}

enum MealType { breakfast, lunch, dinner }

class Recipe {
  String name;
  List<FoodModel> ingredients;
  String instructions;
  MealType mealType;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    name: json['name'],
    ingredients: List<FoodModel>.from(json['ingredients'].map((x) => FoodModel.fromJson(x))),
    instructions: json['instructions'],
    mealType: MealType.values.firstWhere((e) => e.toString().split('.').last == json['mealType']),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'ingredients': List<dynamic>.from(ingredients.map((x) => x.toJson())),
    'instructions': instructions,
    'mealType': mealType.toString().split('.').last,
  };
}

class MealPlan {
  DateTime date;
  List<Recipe> recipes;

  MealPlan({
    required this.date,
    required this.recipes,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) => MealPlan(
    date:json['date']!=null? DateTime.parse(json['date']): DateTime.now(),
    recipes: List<Recipe>.from(json['recipes'].map((x) => Recipe.fromJson(x))),
  );

  factory MealPlan.fromJsonC(Map<String, dynamic> json) => MealPlan(
    date:json['date']!=null? DateTime.parse(json['date']): DateTime.now(),
    recipes: List<Recipe>.from(json['recipes'].map((x) => Recipe.fromJson(jsonDecode(x)))),
  );
  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'recipes': List<dynamic>.from(recipes.map((x) => x.toJson())),
  };
}