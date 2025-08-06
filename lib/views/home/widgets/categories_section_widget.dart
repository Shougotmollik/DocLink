import 'package:doclink/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesSectionWidget extends StatelessWidget {
  final String titleText;
  final VoidCallback onTap;
  const CategoriesSectionWidget({
    super.key,
    required this.titleText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(onPressed: onTap, child: const Text('See All')),
      ],
    );
  }
}
