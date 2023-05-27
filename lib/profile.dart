import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:pro_med_test/clinic_bloc/clinic_bloc.dart';
import 'package:pro_med_test/resources/assets_manager.dart';
import 'package:pro_med_test/resources/color_manager.dart';
import 'package:pro_med_test/resources/routes_manager.dart';
import 'package:pro_med_test/resources/styles_manager.dart';
import 'package:pro_med_test/widgets/clinic_item.dart';
import 'package:pro_med_test/widgets/dropdown_buttons.dart';
import 'package:pro_med_test/widgets/footer_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset(ImageAssets.icon1)],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 194.h,
              width: double.infinity,
              color: ColorManager.primary.withAlpha(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Image.asset(
                    ImageAssets.doctorPhoto,
                    fit: BoxFit.fill,
                    height: 96.h,
                  ),
                  Text(
                    'Dr. Ahmed Khaled',
                    style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Dentists',
                    style:
                        getSemiBoldStyle(color: ColorManager.textGrey, fontSize: 12.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 34.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Clinics',
                    style:
                        getSemiBoldStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.addRoute);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 24.sp,
                        ),
                        Text(
                          'Add Clinic',
                          style: getSemiBoldStyle(
                              color: ColorManager.primary, fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: BlocBuilder<ClinicBloc, ClinicState>(
                  builder: (context, state) {
                if (state.clinics.isEmpty) {
                  return Center(
                    child: Text('EMPTY'),
                  );
                } else if (state.clinics.isNotEmpty) {
                  return ListView.separated(
                    itemCount: state.clinics.length,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      separatorBuilder: (context,index)=> SizedBox(height: 20.h,),
                      itemBuilder: (context,index)=> ClinicItem(clinicModel: state.clinics[index])
                  );
                } else {
                  return Center(
                    child: Text('EMPTY'),
                  );
                }
              }),
            ),
            const FooterWidget()
          ],
        ),
      ),
    );
  }
}
