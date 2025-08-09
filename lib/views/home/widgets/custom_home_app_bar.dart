import 'package:doclink/routes/route_names.dart';
import 'package:doclink/utils/app_assets.dart';
import 'package:doclink/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const CustomCircleAvatar(
          imagePath: AppAssets.userAvatar,
          radius: 28,
        ),
        title: const Text("Hi,Welcome Back,"),
        titleTextStyle: textTheme.bodySmall,
        subtitle: const Text('Shougot Mollik'),
        subtitleTextStyle: textTheme.bodyLarge?.copyWith(fontSize: 18),
        trailing: IconButton(
          onPressed: () {
            Get.toNamed(RouteNames.notificationScreen);
          },
          icon: const Icon(Icons.notifications_none_outlined),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
