import 'package:doclink/controllers/auth_controller.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/utils/app_assets.dart';
import 'package:doclink/utils/form_validator.dart';
import 'package:doclink/views/auth/widgets/auth_text_form_field.dart';
import 'package:doclink/views/auth/widgets/devider_text_widget.dart';
import 'package:doclink/views/auth/widgets/rich_text_widget.dart';
import 'package:doclink/views/auth/widgets/social_button_widget.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:doclink/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController controller = Get.find<AuthController>();
  final FormValidator formValidator = FormValidator();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Create New Account'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 14,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Full Name', style: textTheme.bodyLarge),
                AuthTextFormField(
                  hintText: 'Enter Your Full Name',
                  prefixIcon: Icons.person,
                  textEditingController: controller.nameTEController,
                  showToggle: false,
                  validator: formValidator.validateName,
                ),
                Text('Email', style: textTheme.bodyLarge),
                AuthTextFormField(
                  hintText: 'Enter Your Email',
                  prefixIcon: Icons.email_outlined,
                  textEditingController: controller.emailTEController,
                  showToggle: false,
                  validator: formValidator.validateEmail,
                ),
                Text('Password', style: textTheme.bodyLarge),
                AuthTextFormField(
                  hintText: 'Enter Your Password',
                  prefixIcon: Icons.lock_outline,
                  textEditingController: controller.passwordTEController,
                  validator: formValidator.validatePassword,
                  showToggle: true,
                ),
                Text('Mobile Number', style: textTheme.bodyLarge),
                AuthTextFormField(
                  hintText: 'Enter Your Mobile Number',
                  prefixIcon: Icons.quick_contacts_dialer_outlined,
                  textEditingController: controller.mobileTEController,
                  validator: formValidator.validateMobile,
                ),
                const SizedBox(height: 14),
                Obx(
                  () => CustomElevatedButton(
                    btnText: controller.regiLoading.value
                        ? 'Loading...'
                        : 'Sign Up',
                    onTap: _signUpButton,
                  ),
                ),
                const DeviderTextWidget(),
                _buildSocialLoginSection(),
                _buildSignInSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUpButton() {
    formValidator.validateAndProceed(_formKey, () {
      controller.userRegistration(
        name: controller.nameTEController.text.trim(),
        email: controller.emailTEController.text.trim(),
        password: controller.passwordTEController.text,
        mobile: controller.mobileTEController.text.trim(),
      );
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

  Widget _buildSignInSection() {
    return Align(
      alignment: Alignment.center,
      child: RichTextWidget(
        firstText: "Already have an account? ",
        secondText: 'Sign In',
        onTap: () => Get.offAllNamed(RouteNames.signInScreen),
      ),
    );
  }
}
