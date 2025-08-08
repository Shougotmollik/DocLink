import 'package:doclink/views/home/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:doclink/theme/app_colors.dart';

class CategoriesCard extends StatelessWidget {
  final CategoryModel categories;

  const CategoriesCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      width: size.width * 0.3,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          categories.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
