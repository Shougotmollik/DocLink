import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/controllers/doctor_appointment_controller.dart';

class AppointmentDayWidget extends StatelessWidget {
  final List<String> workingDays;
  final void Function(String selectedDay)? onDaySelected;

  const AppointmentDayWidget({
    super.key,
    required this.workingDays,
    this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorAppointmentController>();
    final textTheme = Theme.of(context).textTheme;

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: workingDays.map((day) {
            final isSelected = controller.selectedDay.value == day;

            return GestureDetector(
              onTap: () {
                controller.selectDay(day);
                if (onDaySelected != null) onDaySelected!(day);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
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
      );
    });
  }
}
