import 'package:doclink/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TabPair {
  final Tab tab;
  final Widget view;

  TabPair({required this.tab, required this.view});
}

class AppointmentTabBarScreen extends StatefulWidget {
  final List<TabPair> tabPairs;

  const AppointmentTabBarScreen({super.key, required this.tabPairs});

  @override
  _AppointmentTabBarScreenState createState() =>
      _AppointmentTabBarScreenState();
}

class _AppointmentTabBarScreenState extends State<AppointmentTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabPairs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: AppColors.onPrimary,
              unselectedLabelColor: AppColors.onBackground,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              tabs: widget.tabPairs.map((pair) => pair.tab).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.tabPairs.map((pair) => pair.view).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
