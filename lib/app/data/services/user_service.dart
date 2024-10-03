import 'dart:convert';
import 'package:afeco/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class UserService{
  final _getStorage = GetStorage();
  final _storageKey = 'User';
  static UserService instance = UserService._();
  // ignore: empty_constructor_bodies
  UserService._() {}
  set user(UserModel? user ) {
    if(user!=null){
      _getStorage.write(_storageKey,jsonEncode(user.toJson()) );
    }
  }

  UserModel? get user {
    var storage = _getStorage.read(_storageKey);
    if(storage!=null){
      return UserModel.fromJson(jsonDecode(storage) as Map<String,dynamic>) ;
    }
    return null;
  }
  bool isLogged(){
    return user!=null;
  }
  void removeUser(){
    _getStorage.remove(_storageKey);
  }
}
