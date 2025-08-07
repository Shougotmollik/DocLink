import 'package:doclink/controllers/home_controller.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/views/home/widgets/home_screen_banner_slider.dart';
import 'package:doclink/views/home/widgets/categories_card.dart';
import 'package:doclink/views/home/widgets/categories_section_widget.dart';
import 'package:doclink/views/home/widgets/custom_home_app_bar.dart';
import 'package:doclink/views/home/widgets/custom_search_bar.dart';
import 'package:doclink/views/home/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: const CustomHomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomSearchBar(),
              const SizedBox(height: 12),
              const HomeScreenBannerSlider(),
              CategoriesSectionWidget(titleText: 'Categories', onTap: () {}),
              _buildCategoriesSection(size, controller),
              const SizedBox(height: 8),
              CategoriesSectionWidget(
                titleText: 'All Doctors',
                onTap: () {
                  Get.toNamed(
                    RouteNames.doctorListScreen,
                    arguments: controller.doctorList,
                  );
                },
              ),
              _buildDoctorListSection(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorListSection(HomeController controller) {
    return Column(
      children: List.generate(
        2,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DoctorCard(doctor: controller.doctorList[index]),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection(Size size, HomeController controller) {
    return SizedBox(
      height: size.height * 0.08,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            CategoriesCard(categories: controller.categories[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: 4,
      ),
    );
  }
}
