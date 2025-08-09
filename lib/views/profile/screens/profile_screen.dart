import 'package:doclink/controllers/profile_controller.dart';
import 'package:doclink/utils/app_assets.dart';
import 'package:doclink/views/profile/widgets/profile_menu_card.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:doclink/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ProfileController controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Profile'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            const CustomCircleAvatar(
              imagePath: AppAssets.userAvatar,
              radius: 58,
            ),
            Text('Shougot Mollik', style: textTheme.bodyLarge),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    ProfileMenuCard(menuCard: controller.menuItems[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: controller.menuItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
