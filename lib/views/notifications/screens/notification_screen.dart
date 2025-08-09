import 'package:doclink/controllers/notification_controller.dart';
import 'package:doclink/views/notifications/widgets/notification_card.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller =
        Get.find<NotificationController>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Notifications'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New', style: textTheme.bodyLarge),
                TextButton(onPressed: () {}, child: const Text('Mark All')),
              ],
            ),

            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) => NotificationCard(
                  notification: controller.notifications[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
