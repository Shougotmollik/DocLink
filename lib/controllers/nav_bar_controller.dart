import 'package:doclink/routes/route_names.dart';
import 'package:doclink/views/appointment/appointment_screen.dart';
import 'package:doclink/views/home/home_screen.dart';
import 'package:doclink/views/message/message_screen.dart';
import 'package:doclink/views/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = const [
    HomeScreen(),
    AppointmentScreen(),
    MessageScreen(),
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

  void backToProfileScreen() {
    currentIndex.value = 4;
  }
}
