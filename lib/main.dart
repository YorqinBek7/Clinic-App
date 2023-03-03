import 'package:clinic_app/screens/routers.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    const ClinicApp(),
  );
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinic',
      debugShowCheckedModeBanner: false,
      theme: _lightMode(),
      initialRoute: ClinicRoutes.mainTab,
      onGenerateRoute: Routes().generatedRoute,
    );
  }

  ThemeData _lightMode() {
    return ThemeData(
      scaffoldBackgroundColor: ClinicColors.scaffoldColor,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: ClinicColors.appBarTextColor),
        backgroundColor: ClinicColors.scaffoldColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ClinicColors.scaffoldColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Lato',
          color: ClinicColors.appBarTextColor,
          fontSize: 29.0,
          fontWeight: FontWeight.w900,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Lato',
          color: ClinicColors.appBarTextColor,
          fontSize: 22.0,
          fontWeight: FontWeight.w800,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Lato',
          color: ClinicColors.C_808080,
          fontSize: 15.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
