import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/profile/model/profile_menu_card_model.dart';
import 'package:flutter/material.dart';

class ProfileMenuCard extends StatelessWidget {
  final ProfileMenuCardModel menuCard;

  const ProfileMenuCard({super.key, required this.menuCard});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(40),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(menuCard.leadingIcon, color: AppColors.primary),
      ),
      title: Text(menuCard.title),
      titleTextStyle: textTheme.bodyLarge?.copyWith(fontSize: 20),
      trailing: const Icon(Icons.keyboard_arrow_right, color: AppColors.grey),
    );
  }
}
