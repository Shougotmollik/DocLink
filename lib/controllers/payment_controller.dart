import 'package:doclink/views/payment/model/payment_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final selectedMethod = "card".obs;

  final List<PaymentCardModel> cards = [
    PaymentCardModel(
      cardNumber: "6277 7654 2527 4778",
      holderName: "SHOUGOT MOLLIK",
      expiry: "02/30",
      colorValue: Colors.deepPurpleAccent.value,
    ),
    PaymentCardModel(
      cardNumber: "6277 7654 2527 4778",
      holderName: "MOLLIK SHOUGOT",
      expiry: "02/30",
      colorValue: Colors.purple.shade100.value,
    ),
  ];

  void selectMethod(String method) {
    selectedMethod.value = method;
  }

  void addCard(PaymentCardModel card) {
    cards.add(card);
  }
}
