import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/notifications/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      child: ListTile(
        leading: const Icon(Icons.notifications_active_outlined),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(notification.title),
            Text(
              notification.createdAt,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.onBackground,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        titleTextStyle: textTheme.bodyLarge?.copyWith(fontSize: 18),
        subtitle: Text(notification.message),
        subtitleTextStyle: textTheme.bodySmall,
      ),
    );
  }
}
