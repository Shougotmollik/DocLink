import 'package:flutter/material.dart';

class DeviderTextWidget extends StatelessWidget {
  const DeviderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.center,
      child: Text(
        'OR',
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
