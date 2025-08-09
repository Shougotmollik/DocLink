import 'package:doclink/routes/route_names.dart';
import 'package:doclink/views/appointment/screens/appointment_screen.dart';
import 'package:doclink/views/doctor/screens/doctor_list_screen.dart';
import 'package:doclink/views/home/screens/home_screen.dart';
import 'package:doclink/views/profile/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = const [
    HomeScreen(),
    DoctorScreen(),
    AppointmentScreen(),
    ProfileScreen(),
  ];

  void updateIndex(int index) {
    currentIndex.value = index;
    update();
  }

  void backToHomeScreenAndClearStack() {
    Get.offAllNamed(RouteNames.mainNavBarScreen);
    currentIndex.value = 0;
  }

  void doctorScreen() {
    currentIndex.value = 1;
  }
}
