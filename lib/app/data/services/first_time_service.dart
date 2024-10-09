
import 'package:get_storage/get_storage.dart';

class FirstTimeService{
  final _getStorage = GetStorage();
  final _storageKey = 'FirstTime';
  static FirstTimeService instance = FirstTimeService._();
  // ignore: empty_constructor_bodies
  FirstTimeService._() {}
  set isFirstTime(bool val ) {
      _getStorage.write(_storageKey,val);
  }
  bool get isFirstTime {
    var storage = _getStorage.read(_storageKey);
    if(storage!=null){
      return storage as bool ;
    }
    return true;
  }
}

