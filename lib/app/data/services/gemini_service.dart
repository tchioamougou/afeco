import 'dart:convert';

import 'package:afeco/app/data/models/food_inventory_model.dart';
import 'package:afeco/app/data/models/food_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  static const String baseUrl =
      'https://api.gemini.com'; // Remplacer par l'URL réelle de l'API Gemini
  static const String apiKey = "AIzaSyAksMqJNbIlvGKsHioOisW0KW71f4bKRQY";
  static GenerativeModel model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: apiKey,
  );
  static GenerativeModel modelJson = GenerativeModel(
       model: 'gemini-1.5-flash-latest',
       apiKey: apiKey,
       generationConfig:
       GenerationConfig(responseMimeType: 'application/json'));

  static Future<List<MealPlan>> generatePlan(List<FoodInventoryShow> ingredients) async {
    final content = [
      Content.text(
        '''
        Generate a recipe for a healthy, balanced dinner with the following ingredients 
        Prioritize foods: By expiration date.
        Create balanced combinations: Taking into account the nutritional quality of foods.
        Adapt to a given period: Depending on the quantity of food available.
        Propose precise quantities: For each food in each meal.
        ${ingredients.map((e)=>e.toJson().toString())}
        
        
        .return data in this format
            [ {
              "date": "2024-10-16T00:00:00.000Z",
              "recipes": [
                {
                  "name": "Apple Pie",
                  "ingredients": [{
                      "name": "Apples",
                      "quantity": "4",
                      "expirationDate": "2024-10-25T00:00:00.000Z",
                      "category": "Fruit"
                    },
                    {
                      "name": "Sugar",
                      "quantity": "1 cup",
                      "expirationDate": null,  // Can be null if there's no expiration
                      "category": "Baking"
                    }],  // Same structure as the Recipe example above
                  "instructions": "...",
                  "mealType": "dessert"
                },
                {
                  "name": "Pasta Primavera",
                  "ingredients": [...],
                  "instructions": "...",
                  "mealType": "dinner"
                }
              ]
            }]
        '''
      )
    ];
    final response = await modelJson.generateContent(content);
    final List<dynamic> data = jsonDecode(response.text!);
    return data.map((e)=>MealPlan.fromJson(e)).toList();
  }
}
