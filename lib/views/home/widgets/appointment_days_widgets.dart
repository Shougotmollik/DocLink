import 'package:doclink/controllers/doctor_appointment_controller.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentDaysWidget extends StatelessWidget {
  const AppointmentDaysWidget({
    super.key,
    required this.doctor,
    this.onDaySelected,
  });

  final DoctorModel doctor;
  final void Function(String selectedDay)? onDaySelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final DoctorAppointmentController appointmentController =
        Get.find<DoctorAppointmentController>();

    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: doctor.workingDays.map((day) {
            final isSelected = appointmentController.selectedDay.value == day;
            return GestureDetector(
              onTap: () {
                appointmentController.selectDay(day);
                if (onDaySelected != null) {
                  onDaySelected!(day);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.grey.withAlpha(122),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  day,
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
