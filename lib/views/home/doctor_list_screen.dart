import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:doclink/views/home/widgets/custom_search_bar.dart';
import 'package:doclink/views/home/widgets/doctor_card.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DoctorModel> doctorList = Get.arguments;

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
                    DoctorCard(doctor: doctorList[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: doctorList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
