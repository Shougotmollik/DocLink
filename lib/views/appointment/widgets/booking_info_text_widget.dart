import 'package:flutter/material.dart';

class BookingInfoTextWidget extends StatelessWidget {
  final String subject;
  final String info;

  const BookingInfoTextWidget({
    super.key,
    required this.subject,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(subject), Text(info)],
      ),
    );
  }
}
