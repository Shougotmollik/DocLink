import 'package:doclink/controllers/home_controller.dart';
import 'package:doclink/views/home/widgets/custom_search_bar.dart';
import 'package:doclink/views/doctor/widgets/doctor_card.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      appBar: const CustomAppBar(titleText: 'All Doctors'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomSearchBar(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    DoctorCard(doctor: controller.doctorList[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: controller.doctorList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
