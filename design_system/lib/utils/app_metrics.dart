import 'package:flutter/material.dart';

class AppMetrics {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 768;
  static bool isTabletOrGreater(BuildContext context) => MediaQuery.of(context).size.width >= 768;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1280;
}
