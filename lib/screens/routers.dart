import 'package:clinic_app/screens/tab_box/home_screen/doctors_screen/doctors_screen.dart';
import 'package:clinic_app/screens/unknown_screen.dart';
import 'package:clinic_app/utils/constants.dart';
import 'package:flutter/widgets.dart';

class Routes {
  Route generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstantRoutes.doctorsScreen:
        return navigateRoute(const DoctorsScreen(), settings);
      default:
        return navigateRoute(const UnknownScreen(), settings);
    }
  }

  PageRouteBuilder navigateRoute(Widget widget, RouteSettings settings) {
    return PageRouteBuilder(
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
