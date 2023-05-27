import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}

// thin style

TextStyle getThinStyle(
    {double? fontSize, required Color color}) {
  return _getTextStyle(
    fontSize??  12.sp, FontWeightManager.thin, color);
}
// regular style

TextStyle getRegularStyle(
    {double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize??  12.sp, FontWeightManager.regular, color);
}
// light text style

TextStyle getLightStyle(
    {double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize??  12.sp, FontWeightManager.light, color);
}
// bold text style

TextStyle getBoldStyle(
    {double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize??  15.sp, FontWeightManager.bold, color);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize??  12.sp, FontWeightManager.semiBold, color);
}