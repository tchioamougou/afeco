import 'dart:convert';
import 'package:appwrite/models.dart';
import 'package:get_storage/get_storage.dart';

class SessionService {
  final _getStorage = GetStorage();
  final _storageKey = 'Session';
  static SessionService instance = SessionService._();
  // ignore: empty_constructor_bodies
  SessionService._() {}
  set currentSession(Session? val) {
    if (val != null) {
      _getStorage.write(_storageKey, val.toMap());
    }
  }

  Session? get currentSession {
   // removeSession();
    var storage = _getStorage.read(_storageKey);
    if (storage != null) {
      print(storage);
      return Session.fromMap(storage as Map<String,dynamic>);
    }
    return null;
  }
  bool isLogged(){
    return currentSession!=null;
  }

  bool isStore(){
    return isLogged() && currentSession?.factors[0]=='phone';
  }
  void removeSession(){
    _getStorage.remove(_storageKey);
  }
}
