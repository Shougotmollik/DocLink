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
