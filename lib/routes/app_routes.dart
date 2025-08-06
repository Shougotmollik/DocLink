import 'package:doclink/controller_binder.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/views/appointment/appointment_screen.dart';
import 'package:doclink/views/auth/sign_in_screen.dart';
import 'package:doclink/views/auth/sign_up_screen.dart';
import 'package:doclink/views/auth/splash_screen.dart';
import 'package:doclink/views/home/doctor_list_screen.dart';
import 'package:doclink/views/main_nav_bar/main_nav_bar_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: RouteNames.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: RouteNames.signInScreen,
      page: () => const SignInScreen(),
      transition: Transition.leftToRight,
      binding: ControllerBinder(),
    ),
    GetPage(
      name: RouteNames.signUpScreen,
      page: () => const SignUpScreen(),
      transition: Transition.leftToRight,
      binding: ControllerBinder(),
    ),
    GetPage(
      name: RouteNames.mainNavBarScreen,
      page: () => const MainNavBarScreen(),
      transition: Transition.fadeIn,
      binding: ControllerBinder(),
    ),
    GetPage(
      name: RouteNames.doctorListScreen,
      page: () => const DoctorListScreen(),
      transition: Transition.rightToLeft,
      binding: ControllerBinder(),
    ),
    GetPage(
      name: RouteNames.appointmentScreen,
      page: () => const AppointmentScreen(),
      transition: Transition.rightToLeft,
      binding: ControllerBinder(),
    ),
  ];
}
