import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:pro_med_test/model/clinic_model.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import 'dropdown_buttons.dart';

class ClinicItem extends StatelessWidget {
 final ClinicModel clinicModel;
  const ClinicItem({Key? key, required this.clinicModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 208.h,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorManager.lightGrey.withAlpha(80)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(onTap: () async {
                final availableMaps =
                await MapLauncher.installedMaps;

                await availableMaps.first.showMarker(
                  coords: Coords(
                      clinicModel.latitude.isNotEmpty ? double.parse(clinicModel.latitude):0, clinicModel.longitude.isNotEmpty ? double.parse(clinicModel.longitude):0),
                  title: '',
                );
              },child: Image.asset(ImageAssets.mapImage,fit: BoxFit.fill,height: 48.h,width: 48.h,)),
              SizedBox(width: 12.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(clinicModel.clinicName,style: getSemiBoldStyle(color: ColorManager.black,fontSize: 16.sp),),
                  SizedBox(height: 8.h,),
                  Text('${clinicModel.city}, ${clinicModel.country}',style: getSemiBoldStyle(color: ColorManager.textGrey,fontSize: 12.sp),),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h,),
          Container(height: 64.h,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
                border: Border.all(width: 1.sp,color: ColorManager.lightGrey),
                borderRadius: BorderRadius.circular(8.r)
            ),
            child: Column(
              children: [
                Row(children: [
                  SizedBox(width: 16.w,),
                  Expanded(child: Text('Available Hours: ${clinicModel.listOfDays[0].substring(0,3)}: ${clinicModel.fromTimes[0]} - ${clinicModel.toTimes[0]}',overflow: TextOverflow.fade,maxLines: 1,)),
                  SizedBox(
                    width: 25.w,
                    height: 20.h,
                    child: CustomButton(
                        items: clinicModel
                            .listOfDays.map((e) => '${e.substring(0,3)}: ${clinicModel.fromTimes.elementAt(clinicModel.listOfDays.indexOf(e))}-${clinicModel.toTimes.elementAt(clinicModel.listOfDays.indexOf(e))}').toList()),
                  ),
                  SizedBox(width: 16.w,),
                ],),
                const Expanded(child: Divider()),
                Row(children: [
                  SizedBox(width: 16.w,),
                  Expanded(child: Text('Reset Times: ${clinicModel.listOfDays[0].substring(0,3)}: ${clinicModel.resetFromTimes[0]} - ${clinicModel.resetToTimes[0]}',overflow: TextOverflow.fade,maxLines: 1,)),
                  SizedBox(
                    width: 25.w,
                    height: 20.h,
                    child: CustomButton(
                        items: clinicModel
                            .listOfDays.map((e) => '${e.substring(0,3)}: ${clinicModel.resetFromTimes.elementAt(clinicModel.listOfDays.indexOf(e))}-${clinicModel.resetToTimes.elementAt(clinicModel.listOfDays.indexOf(e))}').toList()),
                  ),
                  SizedBox(width: 16.w,),
                ],),
              ],
            ),
          ),
          SizedBox(height: 8.h,),
          Text('Appointment Time',style: getSemiBoldStyle(color: ColorManager.primary,fontSize: 12.sp).copyWith(decoration: TextDecoration.underline)),
          SizedBox(height: 8.h,),
          Text('Or Book by Number: ${clinicModel.phone}',style: getSemiBoldStyle(color: ColorManager.primary,fontSize: 12.sp).copyWith(decoration: TextDecoration.underline)),
        ],
      ),
    );
  }
}
