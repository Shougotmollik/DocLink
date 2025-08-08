import 'package:doclink/views/payment/model/payment_card_model.dart';
import 'package:flutter/material.dart';

class PaymentCardItem extends StatelessWidget {
  final PaymentCardModel card;

  const PaymentCardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(card.colorValue),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.credit_card, color: Colors.white),
              Icon(Icons.nfc, color: Colors.white),
            ],
          ),
          const Spacer(),
          Text(
            card.cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Card holder name\n${card.holderName}",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                "Expiry date\n${card.expiry}",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
