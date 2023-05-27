import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_med_test/map_bloc/map_bloc.dart';
import 'package:pro_med_test/profile.dart';
import 'package:pro_med_test/resources/routes_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'clinic_bloc/clinic_bloc.dart';
import 'resources/theme_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationLightTheme(),
          home: child,
        );
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ClinicBloc>(
            create: (context) =>
            ClinicBloc()
              ..add(LoadClinics()),
          ),
          BlocProvider<MapBloc>(
            create: (context) => MapBloc(),
          ),
        ],
        child: Router(
          backButtonDispatcher: RootBackButtonDispatcher(),
          routerDelegate: appRouter,
        ),
      ),
    );
  }
}
