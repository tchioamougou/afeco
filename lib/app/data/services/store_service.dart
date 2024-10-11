import 'package:afeco/app/data/models/store_model.dart';
import 'package:get_storage/get_storage.dart';

class StoreService {
  final _getStorage = GetStorage();
  final _storageKey = 'Store';
  static StoreService instance = StoreService._();
  // ignore: empty_constructor_bodies
  StoreService._() {}
  set store(StoreModel? val) {
    if (val != null) {
      _getStorage.write(_storageKey, val.toJson());
    }
  }

  StoreModel? get store {
    // removeSession();
    var storage = _getStorage.read(_storageKey);
    if (storage != null) {
      print(storage);
      return StoreModel.fromJson(storage as Map<String,dynamic>);
    }
    return null;
  }

  bool isStore(){
    return store!=null;
  }
  void removeStore(){
    _getStorage.remove(_storageKey);
  }
}
