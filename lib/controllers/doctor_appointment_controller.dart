import 'package:get/get.dart';

class DoctorAppointmentController extends GetxController {
  RxString selectedHour = ''.obs;
  RxString selectedDay = ''.obs;

  void selectHour(String hour) {
    selectedHour.value = hour;
  }

  void selectDay(String day) {
    selectedDay.value = day;
  }
}
