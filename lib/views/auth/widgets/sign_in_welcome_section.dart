import 'package:flutter/material.dart';

class SignInWelcomeSection extends StatelessWidget {
  const SignInWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign In',
          style: textTheme.bodyLarge?.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          "Book appointments with doctors easily and securely.",
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
