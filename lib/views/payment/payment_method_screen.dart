import 'package:doclink/controllers/payment_controller.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/utils/app_assets.dart';
import 'package:doclink/views/appointment/widgets/appointment_confirmation_dialog.dart';
import 'package:doclink/views/payment/widgets/payment_card_item.dart';
import 'package:doclink/views/payment/widgets/payment_option_tile.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:doclink/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find<PaymentController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleText: 'Payment Method'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentOptionTile(
                title: "Credit/Debit Card",
                icon: Image.network(AppAssets.cardLogo, height: 25),
                value: "card",
              ),

              if (controller.selectedMethod.value == "card") ...[
                const SizedBox(height: 12),
                SizedBox(
                  height: size.height * 0.23,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.cards.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return PaymentCardItem(card: controller.cards[index]);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: AppColors.secondary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.add, color: AppColors.secondary),
                  label: const Text(
                    "Add New Card",
                    style: TextStyle(color: AppColors.secondary),
                  ),
                  onPressed: () {},
                ),
              ],

              const SizedBox(height: 20),
              PaymentOptionTile(
                title: "Bkash",
                icon: Image.network(AppAssets.nagadLogo, height: 25),
                value: "bkash",
              ),
              const SizedBox(height: 12),
              PaymentOptionTile(
                title: "Nagad",
                icon: Image.network(AppAssets.bkashLogo, height: 25),
                value: "nagad",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: CustomElevatedButton(
          btnText: 'Pay',
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const AppointmentConfirmationDialog(),
            );
          },
        ),
      ),
    );
  }
}
