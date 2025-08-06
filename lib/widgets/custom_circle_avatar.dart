import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imagePath;
  final double radius;

  const CustomCircleAvatar({
    super.key,
    required this.imagePath,
    this.radius = 28,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundImage: AssetImage(imagePath));
  }
}
