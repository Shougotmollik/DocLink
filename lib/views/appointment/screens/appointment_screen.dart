import 'package:doclink/controllers/home_controller.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/appointment/widgets/appointment_tab_bar_screen.dart';
import 'package:doclink/views/appointment/widgets/booked_doctor_card.dart';
import 'package:doclink/views/appointment/widgets/custom_action_button.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    final List<TabPair> myTabs = [
      TabPair(
        tab: const Tab(text: 'Upcoming'),
        view: Column(children: [_buildUpcomingSection(controller)]),
      ),
      TabPair(
        tab: const Tab(text: 'Past'),
        view: Column(children: [_buildPastSection(controller)]),
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(titleText: 'My Bookings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: AppointmentTabBarScreen(tabPairs: myTabs),
      ),
    );
  }

  Widget _buildUpcomingSection(HomeController controller) {
    return Card(
      color: AppColors.background,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BookedDoctorCard(doctor: controller.doctorList[02]),
            const SizedBox(height: 12),
            Row(
              spacing: 20,
              children: [
                CustomActionButton(
                  btnText: 'Cancel',
                  btnColor: AppColors.grey,
                  btnTextColor: AppColors.onBackground,
                  onTap: () {},
                ),
                CustomActionButton(
                  btnText: 'View Details',
                  btnColor: AppColors.primary,
                  btnTextColor: AppColors.onPrimary,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPastSection(HomeController controller) {
    return Card(
      color: AppColors.background,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BookedDoctorCard(doctor: controller.doctorList[05]),
            const SizedBox(height: 12),
            Row(
              spacing: 20,
              children: [
                CustomActionButton(
                  btnText: 'Write Review',
                  btnColor: AppColors.grey,
                  btnTextColor: AppColors.onBackground,
                  onTap: () {},
                ),
                CustomActionButton(
                  btnText: 'Book Again',
                  btnColor: AppColors.primary,
                  btnTextColor: AppColors.onPrimary,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
