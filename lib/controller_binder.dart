import 'package:doclink/controllers/auth_controller.dart';
import 'package:doclink/controllers/home_controller.dart';
import 'package:doclink/controllers/nav_bar_controller.dart';
import 'package:doclink/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
