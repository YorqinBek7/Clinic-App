import 'package:clinic_app/screens/tab_box/home_screen/doctors_screen/doctor_details_screen/book_appointment_screen/book_appoinment_screen.dart';
import 'package:clinic_app/screens/tab_box/home_screen/doctors_screen/doctor_details_screen/doctor_details_screen.dart';
import 'package:clinic_app/screens/tab_box/home_screen/doctors_screen/doctors_screen.dart';
import 'package:clinic_app/screens/tab_box/main_tab.dart';
import 'package:clinic_app/screens/tab_box/patient_history_screen/patient_detail_screen.dart/patient_detail_screen.dart';
import 'package:clinic_app/screens/tab_box/patient_history_screen/patient_saved/patient_saved.dart';
import 'package:clinic_app/screens/unknown_screen.dart';
import 'package:clinic_app/utils/constants.dart';
import 'package:flutter/widgets.dart';

class Routes {
  Route generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case ClinicRoutes.doctorsScreen:
        return navigateRoute(const DoctorsScreen(), settings);
      case ClinicRoutes.mainTab:
        return navigateRoute(const MainTab(), settings);
      case ClinicRoutes.doctorDetailsScreen:
        return navigateRoute(const DoctorDetailsScreen(), settings);
      case ClinicRoutes.bookAppoinmentScreen:
        return navigateRoute(const BookAppointmentScreen(), settings);
      case ClinicRoutes.patiendDetailScreen:
        return navigateRoute(const PatientDetailScreen(), settings);
      case ClinicRoutes.patientSavedScreen:
        return navigateRoute(const PatientSaved(), settings);
      default:
        return navigateRoute(const UnknownScreen(), settings);
    }
  }

  PageRouteBuilder navigateRoute(Widget widget, RouteSettings settings) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
