import 'package:flutter/material.dart';

enum AppTheme { White, Dark }
/// trả về enum value name không cần enum class name.
String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appThemeData = {
  AppTheme.White: ThemeData( //constructor dart support
      brightness: Brightness.light,
      primaryColor: Colors.white,
      fontFamily: "Montserrat"),
  AppTheme.Dark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      fontFamily: "Montserrat"),
};
