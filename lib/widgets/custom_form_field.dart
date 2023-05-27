import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_med_test/resources/styles_manager.dart';

import '../resources/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
 final TextInputType? textInputType;

  const CustomTextField(
      {Key? key, required this.hint, required this.controller, this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorManager.lightGrey, width: 1.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 25,
              blurStyle: BlurStyle.outer,
            )
          ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
        keyboardType: textInputType ?? TextInputType.text,
      ),
    );
  }
}

class CustomPickerTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onTap;
  final String? hint;

  const CustomPickerTextField({Key? key, required this.controller, this.onTap, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 120.w,
      margin: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ColorManager.lightGrey, width: 1.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(10),
              blurRadius: 25,
              blurStyle: BlurStyle.outer,
            )
          ]),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: onTap,
        style: getRegularStyle(color: Colors.black, fontSize: 10.sp),
        decoration: InputDecoration(
          hintText: hint ?? '_',
          suffixIconConstraints: BoxConstraints.tight(Size(25.w, 20.h)),
          suffixIcon: RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.arrow_back_ios,
                size: 12.sp,
                color: ColorManager.primary,
              )),
        ),
      ),
    );
  }
}
