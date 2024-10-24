import 'dart:convert';
import 'package:afeco/app/data/models/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class FilterService {
  final _getStorage = GetStorage();
  final _storageKey = 'Filter';
  static FilterService instance = FilterService._();
  // ignore: empty_constructor_bodies
  FilterService._() {}
  set filter(FilterModel filter) {
    _getStorage.write(_storageKey, jsonEncode(filter.toJson()));
  }

  FilterModel get filter {
    var storage = _getStorage.read(_storageKey);
    if (storage != null) {
      return FilterModel.fromJson(jsonDecode(storage) as Map<String, dynamic>);
    } else {
      return FilterModel(showSoldHow: false, showWasterForBiogas: false, pickupDay: [], pickupWindow: RangeValues(0,24), bagTypes: [], dietaryPreferences: [],showNeighborPackages: false);
    }
  }

  void removeUser() {
    _getStorage.remove(_storageKey);
  }
  void reset(){
    filter=  FilterModel(showSoldHow: false, showWasterForBiogas: false, pickupDay: [], pickupWindow: RangeValues(0,24), bagTypes: [], dietaryPreferences: [],showNeighborPackages: false);
  }
}
