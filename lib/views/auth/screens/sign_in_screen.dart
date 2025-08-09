import 'package:doclink/controllers/auth_controller.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/utils/app_assets.dart';
import 'package:doclink/utils/form_validator.dart';
import 'package:doclink/views/auth/widgets/auth_text_form_field.dart';
import 'package:doclink/views/auth/widgets/devider_text_widget.dart';
import 'package:doclink/views/auth/widgets/forget_password_button.dart';
import 'package:doclink/views/auth/widgets/rich_text_widget.dart';
import 'package:doclink/views/auth/widgets/sign_in_welcome_section.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:doclink/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/social_button_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController controller = Get.find<AuthController>();
  final FormValidator formValidator = FormValidator();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Welcome'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SignInWelcomeSection(),
                const SizedBox(height: 24),
                Text('Email', style: textTheme.bodyLarge),
                const SizedBox(height: 14),
                AuthTextFormField(
                  hintText: 'Enter Your Email',
                  prefixIcon: Icons.email_outlined,
                  textEditingController: controller.emailTEController,
                  showToggle: false,
                  validator: formValidator.validateEmail,
                ),
                const SizedBox(height: 26),
                Text('Password', style: textTheme.bodyLarge),
                const SizedBox(height: 14),
                AuthTextFormField(
                  hintText: 'Enter Your Password',
                  prefixIcon: Icons.lock_outline,
                  textEditingController: controller.passwordTEController,
                  showToggle: true,
                  validator: formValidator.validatePassword,
                ),
                ForgetPasswordButton(btnText: "Forget Password?", onTap: () {}),
                const SizedBox(height: 28),
                CustomElevatedButton(btnText: 'Sign In', onTap: _signInButton),
                const SizedBox(height: 18),
                const DeviderTextWidget(),
                const SizedBox(height: 18),
                _buildSocialLoginSection(),
                const SizedBox(height: 28),
                _buildSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signInButton() {
    formValidator.validateAndProceed(_formKey, () {
      Get.offAllNamed(RouteNames.mainNavBarScreen);
    });
  }

  Widget _buildSocialLoginSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24,
      children: [
        SocialButtonWidget(logoImage: AppAssets.facebookLogo, onTap: () {}),
        SocialButtonWidget(logoImage: AppAssets.googleLogo, onTap: () {}),
      ],
    );
  }

  Widget _buildSignUpSection() {
    return Align(
      alignment: Alignment.center,
      child: RichTextWidget(
        firstText: "Don't have an account? ",
        secondText: 'Sign Up',
        onTap: () => Get.toNamed(RouteNames.signUpScreen),
      ),
    );
  }
}
