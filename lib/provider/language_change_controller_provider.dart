import 'package:flutter/material.dart';

class LanguageChangeControllerProvider with ChangeNotifier{

  Locale? _appLocale;
  Locale? get appLocale => _appLocale;

  void changeLanguage(Locale type){
    _appLocale = type;
    notifyListeners();
  }

}