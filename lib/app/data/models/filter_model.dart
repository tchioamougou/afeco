import 'package:flutter/material.dart';

class FilterModel {
  bool showSoldHow;
  bool showWasterForBiogas;
  List<String> pickupDay;
  RangeValues pickupWindow;
  List<String> bagTypes;
  List<String> dietaryPreferences;

  FilterModel({
    required this.showSoldHow,
    required this.showWasterForBiogas,
    required this.pickupDay,
    required this.pickupWindow,
    required this.bagTypes,
    required this.dietaryPreferences,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      showSoldHow: json['showSoldHow'] ?? false,
      showWasterForBiogas: json['showWasterForBiogas'] ?? false,
      pickupDay: List<String>.from(json['pickupDay'] ?? []),
      pickupWindow: RangeValues(
        json['pickupWindow']['start'] ?? 0.0,
        json['pickupWindow']['end'] ?? 24.0,
      ),
      bagTypes: List<String>.from(json['bagTypes'] ?? []),
      dietaryPreferences: List<String>.from(json['dietaryPreferences'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'showSoldHow': showSoldHow,
      'showWasterForBiogas': showWasterForBiogas,
      'pickupDay': pickupDay,
      'pickupWindow': {
        'start': pickupWindow.start,
        'end': pickupWindow.end,
      },
      'bagTypes': bagTypes,
      'dietaryPreferences': dietaryPreferences,
    };
  }
}