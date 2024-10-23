import 'dart:convert';
import 'package:afeco/app/data/models/filter_model.dart';
import 'package:afeco/app/data/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class FindInService {
  final _getStorage = GetStorage();
  final _storageKey = 'PositionsZone';
  static FindInService instance = FindInService._();
  // ignore: empty_constructor_bodies
  FindInService._() {}
  set findIn(PlaceModel filter) {
    _getStorage.write(_storageKey, jsonEncode(filter.toJson()));
  }

  PlaceModel get findIn {
    var storage = _getStorage.read(_storageKey);
    if (storage != null) {
      return PlaceModel.fromJson(jsonDecode(storage) as Map<String, dynamic>);
    } else {
      return PlaceModel(distance: 2);
    }
  }

  void removeFinIn() {
    _getStorage.remove(_storageKey);
  }
}
