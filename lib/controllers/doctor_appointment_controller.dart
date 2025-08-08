import 'package:doclink/views/appointment/model/appointment_confirm_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doclink/utils/ui_helper.dart';
import 'package:doclink/views/appointment/model/patient_model.dart';

class DoctorAppointmentController extends GetxController {
  // Reactive selected values
  final selectedHour = ''.obs;
  final selectedDay = ''.obs;
  final selectedGender = ''.obs;
  var appointment = Rxn<AppointmentConfirmModel>();

  // TextEditingControllers for patient form
  final patientNameTEController = TextEditingController();
  final patientAgeTEController = TextEditingController();
  final patientProblemTEController = TextEditingController();

  // Setters for selected values
  void selectHour(String hour) => selectedHour.value = hour;

  void selectDay(String day) => selectedDay.value = day;

  void setGender(String gender) => selectedGender.value = gender;

  // Gather patient info into model
  PatientModel getPatientData() {
    return PatientModel(
      name: patientNameTEController.text,
      age: patientAgeTEController.text,
      gender: selectedGender.value,
      problem: patientProblemTEController.text,
    );
  }

  // Validation before submit
  bool patientOnPress() {
    if (patientNameTEController.text.isEmpty ||
        patientAgeTEController.text.isEmpty ||
        selectedGender.value.isEmpty ||
        patientProblemTEController.text.isEmpty) {
      showSnackBar('Sorry!', 'Please fill all fields!');
      return false;
    }
    if (selectedDay.value.isEmpty || selectedHour.value.isEmpty) {
      showSnackBar('Sorry!', 'Please select a day and hour!');
      return false;
    }
    return true;
  }

  // for set confirm appointment
  void setAppointment(AppointmentConfirmModel model) {
    appointment.value = model;
  }

  AppointmentConfirmModel? get getAppointment => appointment.value;

  @override
  void onClose() {
    // Dispose controllers to avoid leaks
    patientNameTEController.dispose();
    patientAgeTEController.dispose();
    patientProblemTEController.dispose();
    super.onClose();
  }
}
