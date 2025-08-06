import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  final String logoImage;
  final VoidCallback onTap;

  const SocialButtonWidget({super.key, required this.logoImage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey.withAlpha(122)),
        ),
        child: ClipOval(child: customImage(imageSource: logoImage)),
      ),
    );
  }
}
