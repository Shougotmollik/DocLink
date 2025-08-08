import 'package:doclink/controllers/doctor_appointment_controller.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:doclink/views/home/widgets/appointment_days_widgets.dart';
import 'package:doclink/views/home/widgets/doctor_details_feature_widget.dart';
import 'package:doclink/views/home/widgets/appointment_hour_widget.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:doclink/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = Get.arguments as DoctorModel;
    final DoctorAppointmentController controller =
        Get.find<DoctorAppointmentController>();

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Appointment'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorDetailsFeatureCard(doctor: doctor),
              const SizedBox(height: 18),
              Text('Details', style: textTheme.bodyLarge),
              const SizedBox(height: 8),
              Text(
                doctor.description,
                style: textTheme.bodySmall,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 18),
              Text('Available Time Slots', style: textTheme.bodyLarge),
              const SizedBox(height: 8),
              AppointmentHourWidget(doctor: doctor),
              const SizedBox(height: 24),
              Text('Doctor’s Weekly Availability', style: textTheme.bodyLarge),
              const SizedBox(height: 8),
              AppointmentDayWidget(workingDays: doctor.workingDays),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: CustomElevatedButton(
          btnText: 'Book an Appointment',
          onTap: () {
            Get.toNamed(
              RouteNames.patientDetailScreen,
              arguments: {
                'doctor': doctor,
                'selectedDay': controller.selectedDay.value,
                'selectedHour': controller.selectedHour.value,
              },
            );
          },
        ),
      ),
    );
  }
}
