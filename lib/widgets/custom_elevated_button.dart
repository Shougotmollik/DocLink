import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;

  const CustomElevatedButton({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.065,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        child: Text(btnText),
      ),
    );
  }
}
