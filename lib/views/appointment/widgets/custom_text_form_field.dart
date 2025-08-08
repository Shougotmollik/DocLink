import 'package:doclink/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey.withAlpha(122),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.black.withAlpha(144),
        ),
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textTheme.bodyMedium,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
