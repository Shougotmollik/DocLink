import 'package:doclink/views/notifications/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: "Appointment Confirmed",
      message:
          "Your appointment with Dr. Sarah Johnson is confirmed for today at 3:00 PM.",
      createdAt: "02:30 PM",
    ),
    NotificationModel(
      title: "New Message",
      message:
          "You have received a new message from Dr. Ahmed Khan regarding your test results.",
      createdAt: "12:45 PM",
    ),
    NotificationModel(
      title: "Payment Successful",
      message:
          "Your payment for the consultation with Dr. Lisa Smith has been successfully processed.",
      createdAt: "06:20 PM",
    ),
    NotificationModel(
      title: "Reminder",
      message:
          "Don't forget your upcoming appointment tomorrow at 10:00 AM with Dr. Michael Brown.",
      createdAt: "09:15 AM",
    ),
    NotificationModel(
      title: "Prescription Ready",
      message:
          "Your prescription from Dr. Emily Davis is ready for pickup at the pharmacy.",
      createdAt: "04:05 PM",
    ),
  ];
}
