import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationLightTheme() {
  return ThemeData(
      // main colors of the app
      primarySwatch: ColorManager.primarySwatch,
      // ripple color

      // App bar theme
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1.sp,
          iconTheme: IconThemeData(color: ColorManager.primary, size: 20.sp),
      ),

      // Icon theme
      iconTheme: IconThemeData(color: ColorManager.primary, size: 20.sp),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle:
                  getRegularStyle(color: Colors.white, fontSize: 23.sp),
              backgroundColor: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)))),

      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.only(
          left: 34.w,right: 14.w
        ),
        // hint style
        hintStyle: getRegularStyle(
            color: ColorManager.textGrey, fontSize: 15.sp),

        // error style
        errorStyle: getRegularStyle(color: Colors.red),

        // enabled border
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide.none,
        ),

        // focused border
        focusedBorder: const OutlineInputBorder(
          borderSide:
          BorderSide.none,
        ),

        // error border
        errorBorder: const OutlineInputBorder(
          borderSide:
          BorderSide.none,
        ),
        // focused error border
        focusedErrorBorder: const OutlineInputBorder(
          borderSide:
          BorderSide.none,
        ),
      ),
);
}
