import 'package:doclink/routes/route_names.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/utils/app_assets.dart';
import 'package:doclink/utils/app_strings.dart';
import 'package:doclink/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Get.offNamed(RouteNames.signInScreen);
    }
  }

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customImage(imageSource: AppAssets.logoImage, height: 140),
            const Text(
              AppStrings.appName,
              style: TextStyle(
                fontSize: 70,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
