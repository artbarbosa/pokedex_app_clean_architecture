import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomTabData {
  final Widget child;
  final String label;

  const CustomTabData({
    required this.label,
    required this.child,
  });
}

class CustomTabView extends StatelessWidget {
  final List<CustomTabData> tabs;
  final bool isMobile;

  const CustomTabView({
    Key? key,
    required this.tabs,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
              dividerColor: Colors.white,
              labelColor: AppColors.red,
              labelStyle: isMobile
                  ? AppTextStylesMobile.extraBold14px.copyWith(color: AppColors.red)
                  : AppTextStylesDesktop.extraBold14px.copyWith(color: AppColors.red),
              unselectedLabelColor: AppColors.grey,
              labelPadding: const EdgeInsets.symmetric(vertical: 16),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              indicatorColor: AppColors.red,
              tabs: tabs.map((tab) => Text(tab.label)).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: tabs.map((tab) => tab.child).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
