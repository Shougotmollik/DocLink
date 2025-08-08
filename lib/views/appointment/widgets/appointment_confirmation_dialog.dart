import 'package:doclink/controllers/doctor_appointment_controller.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentConfirmationDialog extends StatelessWidget {
  const AppointmentConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorAppointmentController controller =
        Get.find<DoctorAppointmentController>();

    final appointment = controller.appointment.value;

    // No data pass
    if (appointment == null) {
      return const SizedBox.shrink();
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Theme.of(context).primaryColor.withAlpha(30),
              child: Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
                size: 48,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'Congratulations!',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Text(
              'Your appointment with ${appointment.doctorName} '
              'is confirmed to ${appointment.date}, at ${appointment.time}.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(RouteNames.mainNavBarScreen);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Done'),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
