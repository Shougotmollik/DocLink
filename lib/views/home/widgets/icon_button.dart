import 'package:doclink/theme/app_colors.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const IconButtonWidget({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(50),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
