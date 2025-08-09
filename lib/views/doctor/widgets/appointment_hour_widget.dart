import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/controllers/doctor_appointment_controller.dart';
import 'package:doclink/views/home/model/doctor_model.dart';

class AppointmentHourWidget extends StatelessWidget {
  final DoctorModel doctor;
  final void Function(String selectedHour)? onHourSelected;

  const AppointmentHourWidget({
    super.key,
    required this.doctor,
    this.onHourSelected,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorAppointmentController>();
    final textTheme = Theme.of(context).textTheme;

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: doctor.workingHours.map((hour) {
            final isSelected = controller.selectedHour.value == hour;

            return GestureDetector(
              onTap: () {
                controller.selectHour(hour);
                if (onHourSelected != null) onHourSelected!(hour);
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
      );
    });
  }
}
