import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = Get.arguments as DoctorModel;
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Appointment'),
      body: Column(
        children: [
          Row(children: [Image.asset(doctor.imagePath)]),
        ],
      ),
    );
  }
}
