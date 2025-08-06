import 'package:doclink/controllers/nav_bar_controller.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainNavBarScreen extends StatefulWidget {
  const MainNavBarScreen({super.key});

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  final NavBarController controller = Get.find<NavBarController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (controller.currentIndex.value != 0) {
            controller.backToHomeScreenAndClearStack();
          } else {
            showConfirmDialog(
              title: 'Exit App',
              text: 'Do you want to exit the app?',
              onTap: () => SystemNavigator.pop(),
            );
          }
        }
      },
      child: Obx(
        () => Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.ease,
            switchOutCurve: Curves.easeInOut,
            child: controller.screens[controller.currentIndex.value],
          ),
          bottomNavigationBar: Obx(() {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Wrap(
                children: [
                  NavigationBar(
                    selectedIndex: controller.currentIndex.value,
                    onDestinationSelected: controller.updateIndex,
                    animationDuration: const Duration(milliseconds: 500),
                    indicatorColor: AppColors.primary,
                    labelTextStyle: const WidgetStatePropertyAll(
                      TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.home_outlined, size: 28),
                        selectedIcon: Icon(Icons.home, size: 28),
                        label: 'Home',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.calendar_month_outlined, size: 28),
                        selectedIcon: Icon(Icons.calendar_month, size: 28),
                        label: 'Appointment',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.message_outlined, size: 28),
                        selectedIcon: Icon(Icons.message_rounded, size: 28),
                        label: 'Message',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.person_2, size: 28),
                        selectedIcon: Icon(Icons.person, size: 28),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
