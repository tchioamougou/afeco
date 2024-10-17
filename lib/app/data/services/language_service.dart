
import 'dart:convert';
import 'dart:ui';
import 'package:afeco/app/data/models/lanquage_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class LanguageService extends GetxService{
  final _getStorage = GetStorage();
  final _storageKey = 'Language';
  static LanguageService instance = LanguageService._();
  // ignore: empty_constructor_bodies
  LanguageService._() {}
  set language(LanguageModel lg ) {
    _getStorage.write(_storageKey,jsonEncode(lg.toJson()) );
  }

  LanguageModel get language {
    var storage = _getStorage.read(_storageKey);
    if(storage!=null){
      return LanguageModel.fromJson(jsonDecode(storage) as Map<String,dynamic>);
    }else{
      final locale = PlatformDispatcher.instance.locale;
      return LanguageModel(
        code:  locale.languageCode,
        name: getLanguageName(locale.languageCode), // Function to get language name
      );
    }
  }
  void removeLanguage(){
    _getStorage.remove(_storageKey);
  }

  String getLanguageName(String languageCode) {
    return languages.where((i)=>i.code==languageCode).first.name; // Replace with actual logic
  }

  Future<void> initLanguage() async {
    // Get device locale
    final locale = PlatformDispatcher.instance.locale;
    final deviceLanguageCode = locale.languageCode;
    // Get saved language from storage
    final localSaveString = _getStorage.read<String>(_storageKey);
    var savedLanguageCode = "";
    if(localSaveString!=null){
      final LanguageModel ls = LanguageModel.fromJson(jsonDecode(localSaveString) as Map<String,dynamic>);
      savedLanguageCode = ls.code;
    }else{
      savedLanguageCode =deviceLanguageCode;
    }

    // Set language based on saved language or device locale
    await Get.updateLocale(Locale(savedLanguageCode));
    language=LanguageModel(
      code: savedLanguageCode ?? deviceLanguageCode,
      name: getLanguageName(savedLanguageCode ?? deviceLanguageCode), // Function to get language name
    );
  }
}

