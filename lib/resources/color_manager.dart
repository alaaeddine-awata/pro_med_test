
import 'package:flutter/material.dart';

class ColorManager {
  static const MaterialColor primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFF48B7E3),
      100: Color(0xFF5DBFE6),
      200: Color(0xFF71C7E9),
      300: Color(0xFF85CFEC),
      400: Color(0xFF9AD7F0),
      500: Color(_primaryValue),
      600: Color(0xFF2F9ECA),
      700: Color(0xFF2A8CB3),
      800: Color(0xFF247A9D),
      900: Color(0xFF1F6986),
    },
  );
  static const int _primaryValue = 0xFF34AFE0;
  static Color primary = Hex16Color.fromHex("#34AFE0");
  static Color lightGrey = Hex16Color.fromHex("#E0E0E0");
  static Color textGrey = Hex16Color.fromHex("#828282");
  static Color black = Hex16Color.fromHex("#333333");
}

extension Hex16Color on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
