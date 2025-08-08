import 'package:doclink/controllers/doctor_appointment_controller.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/appointment/model/appointment_confirm_model.dart';
import 'package:doclink/views/appointment/model/patient_model.dart';
import 'package:doclink/views/appointment/widgets/booking_doctor_card_widget.dart';
import 'package:doclink/views/appointment/widgets/booking_info_text_widget.dart';
import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:doclink/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (Get.arguments ?? {}) as Map<String, dynamic>;

    final doctor = args["doctor"] as DoctorModel?;
    final patient = args["patient"] as PatientModel?;
    final selectedDay = args["selectedDay"] as String? ?? '';
    final selectedHour = args["selectedHour"] as String? ?? '';

    final DoctorAppointmentController controller =
        Get.find<DoctorAppointmentController>();
    final textTheme = Theme.of(context).textTheme;

    // If required data is missing, show error
    if (doctor == null || patient == null) {
      return const Scaffold(
        body: Center(child: Text('Error: Missing booking details.')),
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Booking Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingDoctorCardWidget(doctor: doctor),
              Text(
                'Scheduled Appointment',
                style: textTheme.bodyLarge?.copyWith(fontSize: 20),
              ),
              BookingInfoTextWidget(subject: 'Date', info: selectedDay),
              BookingInfoTextWidget(subject: 'Time', info: selectedHour),
              const BookingInfoTextWidget(
                subject: 'Duration',
                info: '30 Minutes',
              ),
              Divider(color: AppColors.grey.withAlpha(122)),
              Text(
                'Patient Information',
                style: textTheme.bodyLarge?.copyWith(fontSize: 20),
              ),
              BookingInfoTextWidget(subject: 'Name', info: patient.name),
              BookingInfoTextWidget(subject: 'Gender', info: patient.gender),
              BookingInfoTextWidget(subject: 'Age', info: patient.age),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: CustomElevatedButton(
          btnText: 'Confirm & Pay',
          onTap: () {
            controller.setAppointment(
              AppointmentConfirmModel(
                doctorName: doctor.name,
                date: selectedDay,
                time: selectedHour,
              ),
            );
            Get.toNamed(RouteNames.paymentMethodScreen);
          },
        ),
      ),
    );
  }
}
