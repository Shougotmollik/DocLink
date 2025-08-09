import 'package:doclink/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search a Doctor',
        hintStyle: textTheme.bodySmall?.copyWith(fontSize: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(
          Icons.search_outlined,
          color: AppColors.onBackground.withAlpha(120),
        ),
        suffixIcon: Icon(
          Icons.mic_none_outlined,
          color: AppColors.onBackground.withAlpha(120),
        ),
        filled: true,
        fillColor: AppColors.grey.withAlpha(80),
        contentPadding: const EdgeInsets.all(8),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: textTheme.bodyMedium?.copyWith(color: AppColors.onBackground),
    );
  }
}
