import 'package:doclink/controllers/payment_controller.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOptionTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final String value;

  const PaymentOptionTile({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find<PaymentController>();

    return Obx(
      () => InkWell(
        onTap: () => controller.selectMethod(value),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.selectedMethod.value == value
                  ? AppColors.secondary
                  : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Radio(
                value: value,
                groupValue: controller.selectedMethod.value,
                activeColor: AppColors.secondary,
                onChanged: (v) {
                  controller.selectMethod(v!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
