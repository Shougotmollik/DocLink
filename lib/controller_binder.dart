import 'package:doclink/controllers/auth_controller.dart';
import 'package:doclink/controllers/doctor_appointment_controller.dart';
import 'package:doclink/controllers/doctor_controller.dart';
import 'package:doclink/controllers/home_controller.dart';
import 'package:doclink/controllers/nav_bar_controller.dart';
import 'package:doclink/controllers/notification_controller.dart';
import 'package:doclink/controllers/payment_controller.dart';
import 'package:doclink/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DoctorController>(() => DoctorController());
    Get.lazyPut<DoctorAppointmentController>(
      () => DoctorAppointmentController(),
    );
    Get.lazyPut<PaymentController>(() => PaymentController());
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
