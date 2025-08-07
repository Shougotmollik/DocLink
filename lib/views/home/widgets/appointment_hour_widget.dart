import 'package:doclink/controllers/doctor_appointment_controller.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentHourWidget extends StatelessWidget {
  const AppointmentHourWidget({
    super.key,
    required this.doctor,
    this.onHourSelected,
  });

  final DoctorModel doctor;
  final void Function(String selectedHour)? onHourSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final DoctorAppointmentController appointmentController =
        Get.find<DoctorAppointmentController>();
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: doctor.workingHours.map((hour) {
            final isSelected = appointmentController.selectedHour.value == hour;

            return GestureDetector(
              onTap: () {
                appointmentController.selectHour(hour);
                if (onHourSelected != null) {
                  onHourSelected!(hour);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.grey.withAlpha(122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  hour,
                  style: textTheme.bodyMedium?.copyWith(
                    color: isSelected ? AppColors.onPrimary : AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
