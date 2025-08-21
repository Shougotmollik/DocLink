import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/widgets/confirm_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// Custom image helper function for external support
Widget customImage({
  required String imageSource,
  bool isNetwork = false,
  double? height,
  double? width,
  BoxFit boxFit = BoxFit.cover,
}) {
  if (isNetwork) {
    return SvgPicture.network(
      imageSource,
      height: height,
      width: width,
      fit: boxFit,
    );
  } else {
    return SvgPicture.asset(
      imageSource,
      height: height,
      width: width,
      fit: boxFit,
    );
  }
}

// * confirm dialog
void showConfirmDialog({
  required String title,
  required String text,
  required VoidCallback onTap,
}) {
  Get.dialog(ConfirmDialog(title: title, text: text, onTap: onTap));
}

//* snack bar
void showSnackBar(String title, String message, {bool isError = false}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: isError ? AppColors.error : AppColors.success,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
    icon: Icon(isError ? Icons.error : Icons.check_circle, color: Colors.white),
  );
}
