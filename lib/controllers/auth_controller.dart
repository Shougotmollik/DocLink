import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();

  @override
  void dispose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    nameTEController.dispose();
    mobileTEController.dispose();
    super.dispose();
  }
}
