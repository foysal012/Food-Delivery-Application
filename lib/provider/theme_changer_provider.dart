import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier{

  var _themeMode = ThemeMode.light;
  //var _theemeMode = ThemeData.light();

  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode){
    _themeMode = themeMode;
    notifyListeners();
  }

}