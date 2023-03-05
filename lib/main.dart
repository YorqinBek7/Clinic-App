import 'package:clinic_app/screens/routers.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      initialRoute: ClinicRoutes.patiendDetailScreen,
      onGenerateRoute: Routes().generatedRoute,
    );
  }

  ThemeData _lightMode() {
    return ThemeData(
      scaffoldBackgroundColor: ClinicColors.scaffoldColor,
      useMaterial3: true,
      primaryColor: ClinicColors.C_0F9B7B,
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        checkColor: MaterialStateProperty.all(ClinicColors.white),
        fillColor: MaterialStateProperty.all(ClinicColors.C_0F9B7B),
      ),
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
