import 'package:doclink/views/profile/model/profile_menu_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final List<ProfileMenuCardModel> menuItems = [
    ProfileMenuCardModel(title: 'History', leadingIcon: Icons.history),
    ProfileMenuCardModel(title: 'Personal Details', leadingIcon: Icons.person),
    ProfileMenuCardModel(
      title: 'Location',
      leadingIcon: Icons.location_on_outlined,
    ),
    ProfileMenuCardModel(
      title: 'Payment Method',
      leadingIcon: Icons.payment_outlined,
    ),
    ProfileMenuCardModel(title: 'Settings', leadingIcon: Icons.settings),
    ProfileMenuCardModel(
      title: 'Help',
      leadingIcon: Icons.help_outline_outlined,
    ),
    ProfileMenuCardModel(title: 'Logout', leadingIcon: Icons.logout),
  ];
}
