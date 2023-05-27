import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_med_test/resources/assets_manager.dart';
import 'package:pro_med_test/resources/styles_manager.dart';

import '../resources/color_manager.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      height: 147.h,
      color: ColorManager.primary.withAlpha(10),
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(ImageAssets.icon2),
              SizedBox(width: 8.w,),
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: 'Pro',style: getSemiBoldStyle(color: Colors.black,fontSize: 16.sp)),
                  TextSpan(text: 'Med',style: getSemiBoldStyle(color: ColorManager.primary,fontSize: 16.sp)),
                ]
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('About',style: getRegularStyle(color: ColorManager.textGrey,fontSize: 16.sp),),
              Text('Privacy Policy',style: getRegularStyle(color: ColorManager.textGrey,fontSize: 16.sp),),
              Text('Contact Us',style: getRegularStyle(color: ColorManager.textGrey,fontSize: 16.sp),),
            ],
          ),
          Text('© 2023 Pro Med, Inc. All rights reserved.',style: getRegularStyle(color: ColorManager.black,fontSize: 12.sp),)
        ],
      ),
    );
  }
}
