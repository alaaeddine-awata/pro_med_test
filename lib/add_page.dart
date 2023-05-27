import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_med_test/model.dart';
import 'package:pro_med_test/model/clinic_model.dart';
import 'package:pro_med_test/resources/assets_manager.dart';
import 'package:pro_med_test/resources/color_manager.dart';
import 'package:pro_med_test/resources/routes_manager.dart';
import 'package:pro_med_test/resources/styles_manager.dart';
import 'package:pro_med_test/widgets/available_hours_table.dart';
import 'package:pro_med_test/widgets/custom_form_field.dart';
import 'package:pro_med_test/widgets/dropdown_buttons.dart';
import 'package:pro_med_test/widgets/footer_widget.dart';
import 'package:pro_med_test/widgets/map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'clinic_bloc/clinic_bloc.dart';
import 'map_bloc/map_bloc.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController clinicName = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? specialty;
  String? country;
  String? city;
  List<String> specialties = ['specialty1', 'specialty2'];
  List<String> countries = [
    'country1',
    'country2',
    'country3',
    'country4',
    'country5'
  ];
  List<String> cities = ['city1', 'city2'];

  List<String> daysOfWeek = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  List<TextEditingController> fromControllers =
      List.generate(7, (index) => TextEditingController());
  List<TextEditingController> toControllers =
      List.generate(7, (index) => TextEditingController());
  List<TextEditingController> resetFromControllers =
      List.generate(7, (index) => TextEditingController());
  List<TextEditingController> resetToControllers =
      List.generate(7, (index) => TextEditingController());

  @override
  void dispose() {
    clinicName.dispose();
    region.dispose();
    district.dispose();
    street.dispose();
    phone.dispose();
    fromControllers.map((e) => e.dispose());
    toControllers.map((e) => e.dispose());
    resetFromControllers.map((e) => e.dispose());
    resetToControllers.map((e) => e.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.back),
        ),
        actions: [Image.asset(ImageAssets.icon1)],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.home_filled),
                  SizedBox(
                    width: 13.w,
                  ),
                  const Text('Clinics'),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const Icon(Icons.arrow_forward_ios)),
                  BlocBuilder<ClinicBloc, ClinicState>(
                      builder: (context, state) {
                    return Text(
                      'Clinic ${state.clinics.length + 1}',
                      style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              const Text('Basic Info'),
              SizedBox(
                height: 4.h,
              ),
              CustomTextField(
                hint: 'Clinic Name',
                controller: clinicName,
              ),
              CustomDropdownButton(
                  hint: 'Specialty',
                  value: specialty,
                  dropdownItems: specialties,
                  onChanged: (value) {
                    setState(() {
                      specialty = value;
                    });
                  }),
              CustomDropdownButton(
                  hint: 'Country',
                  value: country,
                  dropdownItems: countries,
                  onChanged: (value) {
                    setState(() {
                      country = value;
                    });
                  }),
              CustomDropdownButton(
                  hint: 'City',
                  value: city,
                  dropdownItems: cities,
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  }),
              CustomTextField(
                hint: 'Region',
                controller: region,
              ),
              CustomTextField(
                hint: 'District',
                controller: district,
              ),
              BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  if (state.latitude.isNotEmpty && state.longitude.isNotEmpty) {
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.sp, color: ColorManager.lightGrey),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: MapWidget(
                          longitude: state.longitude, latitude: state.latitude),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            Routes.setLocationOnMapRoute,
                            arguments: MapModel('33.5412719', '36.2470416'));
                      },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.sp, color: ColorManager.lightGrey),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Center(
                          child: Icon(
                            Icons.location_on,
                            size: 50.sp,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              CustomTextField(
                hint: 'Phone Number',
                controller: phone,
                textInputType: TextInputType.phone,
              ),
              const Text('Available Hours'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.only(top: 16.h, bottom: 24.h),
                  child: TimeTable(
                    daysOfWeek: daysOfWeek,
                    fromControllers: fromControllers,
                    toControllers: toControllers,
                    resetFromControllers: resetFromControllers,
                    resetToControllers: resetToControllers,
                  ),
                ),
              ),
              ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: BlocBuilder<MapBloc, MapState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            if (clinicName.text.isNotEmpty &&
                                specialty != null &&
                                country != null &&
                                city != null &&
                                region.text.isNotEmpty &&
                                district.text.isNotEmpty &&
                                state.longitude.isNotEmpty &&
                                state.latitude.isNotEmpty &&
                                phone.text.isNotEmpty &&
                                fromControllers.every(
                                    (element) => element.text.isNotEmpty) &&
                                toControllers.every(
                                    (element) => element.text.isNotEmpty) &&
                                resetFromControllers.every(
                                    (element) => element.text.isNotEmpty) &&
                                resetToControllers.every(
                                    (element) => element.text.isNotEmpty)) {
                              ClinicModel clinicModel = ClinicModel(
                                  clinicName: clinicName.text,
                                  specialty: specialty!,
                                  country: country!,
                                  city: city!,
                                  region: region.text,
                                  district: district.text,
                                  latitude: state.latitude,
                                  longitude: state.longitude,
                                  phone:phone.text,
                                  listOfDays: daysOfWeek,
                                  fromTimes: fromControllers
                                      .map((e) => e.text)
                                      .toList(),
                                  toTimes:
                                      toControllers.map((e) => e.text).toList(),
                                  resetFromTimes: resetFromControllers
                                      .map((e) => e.text)
                                      .toList(),
                                  resetToTimes: resetToControllers
                                      .map((e) => e.text)
                                      .toList());
                              BlocProvider.of<ClinicBloc>(context)
                                  .add(AddClinic(clinicModel));
                              Fluttertoast.showToast(msg: 'Clinic Added Successfully',backgroundColor: Colors.green);
                              Navigator.of(context).pop();
                            } else {
                              Fluttertoast.showToast(msg: 'Please fill out all fildes',backgroundColor: Colors.red);
                            }
                          },
                          child: Text(
                            'Save',
                            style: getRegularStyle(
                                color: Colors.white, fontSize: 20.sp),
                          ));
                    },
                  )),
              SizedBox(
                height: 30.h,
              ),
              const FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
